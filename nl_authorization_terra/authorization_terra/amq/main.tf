module "amq-firewall-rules" {
  source              = "github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/net-vpc-firewall?ref=v14.0.0"
  project_id          = var.network_project #"${local.resource_prefix}shared-vpc${var.environment_suffix}"
  network             = var.tlpnet          #"tlpnet"
  admin_ranges        = []
  http_source_ranges  = []
  https_source_ranges = []
  ssh_source_ranges   = []
  custom_rules = {
    allow-amq-source = {
      description          = "AMQ access."
      direction            = "INGRESS"
      action               = "allow"
      sources              = ["kaa", "kbb", "kca", "amq"]
      ranges               = [var.subnets_in_common[0], var.subnets_in_common[4]]
      targets              = ["amq"]
      use_service_accounts = false
      rules                = [{ protocol = "tcp", ports = [8161, 61616] }]
      extra_attributes     = {}
    }
  }
}

module "amq-uig-1" {
  source        = "github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/compute-vm?ref=v14.0.0"
  project_id    = var.project_id
  zone          = "${var.region}-${var.zones[0]}" #"europe-west4-a"
  name          = "amq-test-1"
  instance_type = "n2-standard-2"
  network_interfaces = [{
    network    = "projects/${var.network_project}/global/networks/${var.tlpnet}",
    subnetwork = "projects/${var.network_project}/regions/${var.region}/subnetworks/${var.subnet_backend_terra}",
    nat        = false,
    addresses  = null
  }]
  tags = ["amq", "ssh"]

  boot_disk = {
    image = "projects/${var.image_project}/global/images/amq-test-node1"
    type  = "pd-ssd"
    size  = 30
  }

  labels = var.labels

  options = {
    allow_stopping_for_update = true
    deletion_protection       = false
    preemptible               = true
  }

  service_account_scopes = var.service_account_scopes

  metadata = {
    startup-script-url = "gs://${var.bucket}/apps/test/amq/startup.sh"
    enable-oslogin     = "TRUE"
  }

  group = {
    named_ports = {
      "http61616" = "61616"
    }
  }
}

module "amq-uig-2" {
  source        = "github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/compute-vm?ref=v14.0.0"
  project_id    = var.project_id
  zone          = "${var.region}-${var.zones[1]}" #"europe-west4-b"
  name          = "amq-test-2"
  instance_type = "n2-standard-2"
  network_interfaces = [{
    network    = "projects/${var.network_project}/global/networks/${var.tlpnet}",
    subnetwork = "projects/${var.network_project}/regions/${var.region}/subnetworks/${var.subnet_backend_terra}",
    nat        = false,
    addresses  = null
  }]
  tags = ["amq", "ssh"]

  boot_disk = {
    image = "projects/${var.image_project}/global/images/amq-test-node2"
    type  = "pd-ssd"
    size  = 30
  }

  labels = var.labels

  options = {
    allow_stopping_for_update = true
    deletion_protection       = false
    preemptible               = true
  }

  service_account_scopes = var.service_account_scopes

  metadata = {
    startup-script-url = "gs://${var.bucket}/apps/test/amq/startup.sh"
    enable-oslogin     = "TRUE"
  }

  group = {
    named_ports = {
      "http61616" = "61616"
    }
  }
}

module "amq-uig-ilb" {
  source        = "github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/net-ilb?ref=v14.0.0"
  project_id    = var.project_id
  region        = var.region
  name          = "amq-ilb"
  service_label = "amq-ilb-fe"
  network       = "projects/${var.network_project}/global/networks/${var.tlpnet}"
  subnetwork    = "projects/${var.network_project}/regions/${var.region}/subnetworks/${var.subnet_backend_terra}"
  ports         = [61616]
  backends = [{
    failover       = false
    group          = module.amq-uig-1.group.self_link
    balancing_mode = "CONNECTION"
    },
    {
      failover       = false
      group          = module.amq-uig-2.group.self_link
      balancing_mode = "CONNECTION"
  }]
  health_check_config = {
    type = "tcp", check = { port = 61616 }, config = {}, logging = true
  }

  depends_on = [
    module.amq-uig-1,
    module.amq-uig-2
  ]
}

data "google_dns_managed_zone" "dns_zone" {
  project = var.dns_private_zone_project
  name    = var.dns_private_zone_name
}

resource "google_dns_record_set" "amq-dns" {
  name         = "amq.${data.google_dns_managed_zone.dns_zone.dns_name}"
  project      = data.google_dns_managed_zone.dns_zone.project
  type         = "A"
  ttl          = 60
  managed_zone = data.google_dns_managed_zone.dns_zone.name
  rrdatas      = [module.amq-uig-ilb.forwarding_rule_address]
}

resource "google_dns_record_set" "amq-dns-cname" {
  name         = "amq${var.region_suffix}.${data.google_dns_managed_zone.dns_zone.dns_name}"
  project      = data.google_dns_managed_zone.dns_zone.project
  type         = "CNAME"
  ttl          = 60
  managed_zone = data.google_dns_managed_zone.dns_zone.name
  rrdatas      = [google_dns_record_set.amq-dns.name]
}

resource "google_dns_record_set" "amq-dns-node1" {
  name         = "amq-node1.${data.google_dns_managed_zone.dns_zone.dns_name}"
  project      = data.google_dns_managed_zone.dns_zone.project
  type         = "A"
  ttl          = 60
  managed_zone = data.google_dns_managed_zone.dns_zone.name
  rrdatas      = [module.amq-uig-1.internal_ip]
}

resource "google_dns_record_set" "amq-dns-node2" {
  name         = "amq-node2.${data.google_dns_managed_zone.dns_zone.dns_name}"
  project      = data.google_dns_managed_zone.dns_zone.project
  type         = "A"
  ttl          = 60
  managed_zone = data.google_dns_managed_zone.dns_zone.name
  rrdatas      = [module.amq-uig-2.internal_ip]
}
