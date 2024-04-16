variable "environment_suffix2" {
  type = string
  #default = "be" #variable
}

variable "environment_suffix3" {
  type = string
  #default = "be" #variable
}

variable "subnet_k8s" {
  type = string
  #default = "kubernetes-west4"
}

variable "subnet_k8s_api" {
  type = string
  #default = "kubernetes-public-api-west4" #variable
}

variable "subnet_database_terra" {
  type = string
  #default = "database-terra-west4" #variable
}

variable "subnet_database2_terra" {
  type = string
  #default = "database-terra-west1" #variable
}

variable "subnet_dmz_terra" {
  type = string
  #default = "dmz-terra-west4" #variable
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

variable "zones2" {
  type = map(any)
  /*default = {
    0 = "a"
    1 = "b"
    2 = "c"
    3 = "d"
  }*/
}

variable "region2" {
  type = string
  #default = "europe-west1" #variable
}

variable "region_suffix" {
  type = string
  #default = "-west4" #variable
}

variable "region_suffix2" {
  type = string
  #default = "-west1" #variable
}

variable "jboss_image_name" {
  type = string
  #default = "ntt-rh79-jboss-eap716-20210525"
}

variable "jboss_image_name731" {
  type    = string
  default = "ntt-rh79-jboss-eap716-20210525"
}


variable "tlpnet" {
  type = string
  #default = "tlpnet"
}

variable "telepass_domain" {
  type = string
  #default = "test.gcp.telepass.com"
}

variable "environment" {
  type = string
}

variable "bucket_environment" {
  type = string
}

variable "ip_addresses_terra" {
  type = map(any)
}

variable "subnets_terra" {
  type = map(any)
}

variable "subnets_in_common" {
  type = map(any)
}

variable "fortigate_routing" {
  type = map(any)
}

variable "ntt_rh85_lvm_auditd" {
  type = string
}

variable "ntt_rh85_lvm_auditd1" {
  type = string
}

variable "ntt_rh85_lvm_auditd2" {
  type = string
}

variable "keys_bucket" {
  type = string
  #default = "bolla-db-keys-nl"
}

variable "keys_bucket2" {
  type = string
  #default = "bolla-db-keys-be"
}