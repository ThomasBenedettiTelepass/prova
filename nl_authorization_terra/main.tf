provider "google" {
}

provider "google-beta" {
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }
  backend "remote" {
    hostname = "tfe.telepass.com"
    organization = "Telepass"
    workspaces {
      name ="nl_authorization_terra"
    }
  }
}

locals { 
  resource_prefix         = var.use_bolla_prefix ? "bolla-" : "tlp-"
  environment_suffix      = length(var.environment_suffix) > 1 ? "-${var.environment_suffix}" : ""
  environment_suffix2     = length(var.environment_suffix2) > 1 ? "-${var.environment_suffix2}" : ""
  region_suffix           = length(var.region_suffix) > 3 ? "-${var.region_suffix}" : ""
  region_suffix2          = length(var.region_suffix2) > 3 ? "-${var.region_suffix2}" : ""
  source_migration_suffix = "-${var.source_migration_suffix}"
}

module "authorization_terra" {
  source               = "./authorization_terra"
  environment_suffix   = local.environment_suffix
  subnet_backend_terra = var.subnet_backend_terra
  region               = var.region
  use_bolla_prefix     = var.use_bolla_prefix
  zones                = var.zones
  tlpnet               = var.tlpnet
  environment          = var.environment
  bucket_environment   = var.bucket_environment
  subnets_in_common    = var.subnets_in_common
  region_suffix = local.region_suffix
  project_id       = (var.use_bolla_prefix || var.environment == "be-prod" ) ? "authz-terra" : "authorization-terra"
  network_project  = var.network_project
  jboss_image_name = var.jboss_image_name
  bucket           = var.bucket
  image_project    = var.image_project
  dns_private_zone = var.dns_private_zone
}

