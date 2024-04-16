locals { 
  resource_prefix = var.use_bolla_prefix ? "bolla-" : "tlp-"
  resource_suffix = var.use_bolla_prefix ? var.environment_suffix : "-${var.environment}"
}

module "kaa" {
  source               = "../../../modules/application"
  project              = "${local.resource_prefix}${var.project_id}${local.resource_suffix}"
  network_project      = var.network_project 
  network              = var.tlpnet          
  region               = var.region
  enable_rmi_mode      = false
  enable_ssh_access    = true 
  ig_size              = var.environment == "dev" ? 1 : var.environment == "test" ? 2 : 4
  enable_subnet_access = true
  application_ranges   = [var.subnets_in_common[0]]
  application_sources  = ["kca", "kdd", "kda", "kva", "ena", "kdb", "ena", "kmb", "kbb", "job-scheduler-test", "mule"] 
  zone   = "${var.region}-${var.zones[1]}" 
  subnet = var.subnet_backend_terra        
  boot_disk = {
    image = "projects/${var.image_project}/global/images/${var.jboss_image_name}" 
    type  = "pd-standard"
    size  = 60
  }
  app_name                 = "kaa"
  startup_bucket           = var.bucket
  environment              = var.bucket_environment
  dns_private_zone_name    = var.dns_private_zone 
  dns_private_zone_project = var.network_project  
  enable_scheduler         = false
  enable_dns_lb = true
}

