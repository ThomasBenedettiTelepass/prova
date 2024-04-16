variable "role_mapping" {
  type    = map(any)
  default = {}
  # default = { "serviceAccount:cxdb10-gcf@infoblu-datalayer-dev.iam.gserviceaccount.com" = ["roles/storage.admin"],
  #             "group:sistemisti_tlp@telepass.com" = ["roles/editor", "roles/iam.serviceAccountUser"],
  #             "user:87003713@gruppo.autostrade.it" = ["roles/editor", "roles/iam.serviceAccountUser"],
  #         }
}

variable "enable_google_api_sa" {
  type        = bool
  description = "enable iam permission for google api service account"
  default     = true
}

variable "bucket" {
  type = string
  #default = "cloud-tlp-deployment-shared-services-test"
}

variable "image_project" {
  type = string
  #default = "cloud-tlp-shared-services-test"
}

variable "dns_private_zone" { #sono uguali ma utilizzate entrambe
  type = string
  #default = "test-gcp-telepass-com"
}

variable "project_id" {
  type = string
  #default = "access-terra" #variable
}

variable "network_project" {
  type = string
}

variable "environment_suffix" {
  type = string
  #default = "nl" #variable
}

variable "subnet_backend_terra" {
  type = string
  #default = "backend-terra-west4" #variable
}

variable "zones" {
  type = map(any)
  /*default = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
  }*/
}

variable "region_suffix" {
  type = string
}

variable "region" {
  type = string
  #default = "europe-west4" #variable
}

variable "jboss_image_name" {
  type = string
  #default = "ntt-rh79-jboss-eap716-20210525""
}

variable "tlpnet" {
  type = string
  #default = "tlpnet"
}

variable "environment" {
  type = string
}

variable "subnets_in_common" {
  type = map(any)
}

variable "use_bolla_prefix" {
  type = bool
  #default = true #variable
}

variable "bucket_environment" {
  type = string
}