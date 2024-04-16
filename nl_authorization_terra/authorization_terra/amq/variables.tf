variable "project_id" {
  type = string
  #default = "bolla_authz_terra_nl"  # Errore 
}

variable "network_project" {
  description = "The netowrk project to attach resources to."
  type        = string
  #default     = "bolla-shared-vpc-nl"
}

variable "service_account_scopes" {
  description = "List of scopes for the instance template service account"
  type        = list(string)

  default = [
    "https://www.googleapis.com/auth/compute.readonly",
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/devstorage.read_only",
  ]
}

variable "bucket" {
  type = string
  #default = "cloud-tlp-deployment-shared-services-test"
}

variable "image_project" {
  type = string
  #default = "cloud-tlp-shared-services-test"
}

variable "labels" {
  description = "Instance labels."
  type        = map(string)
  default     = {}
}

variable "dns_private_zone_project" {
  type        = string
  description = "project id of cloud dns private zone."
}

variable "dns_private_zone_name" {
  type        = string
  description = "Name of the cloud dns private zone."
}

variable "zones" {
  type = map(any)
  /* default = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
  } */
}

variable "region" {
  type = string
}

variable "region_suffix" {
  type = string
}

variable "resource_prefix" {
  type = string
  #default = true #variable
}

variable "subnet_backend_terra" {
  type = string
}

variable "tlpnet" {
  type = string
  #default = "tlpnet"
}

variable "subnets_in_common" {
  type = map(any)
}