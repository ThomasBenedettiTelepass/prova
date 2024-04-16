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
  type    = string
  default = "cloud-tlp-deployment-shared-services-test"
}

variable "image_project" {
  type    = string
  default = "cloud-tlp-shared-services-test"
}

variable "dns_private_zone" { #sono uguali ma utilizzate entrambe
  type    = string
  default = "test-gcp-telepass-com"
}

variable "network_project" {
  type = string
}

variable "network_project2" {
  type = string
}

variable "source_migration_suffix" {
  type        = string
  description = "The suffix of the source project of the migration."
  default     = ""
}