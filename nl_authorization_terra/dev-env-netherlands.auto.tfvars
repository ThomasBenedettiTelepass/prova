environment_suffix     = "nl"
environment_suffix2    = "be"
environment_suffix3    = "be-prod"
subnet_backend_terra   = "default-terra-west4"
subnet_k8s             = "kubernetes2"
subnet_k8s_api         = "kubernetes-public-api"
bucket_environment     = "dev"
source_migration_suffix = "dev"
subnet_database_terra  = "default-terra-west4"
subnet_database2_terra = "default-terra-west1"
subnet_dmz_terra       = "default-terra-west4"
region                 = "europe-west4"
region2                = "europe-west1"
region_suffix          = "west4"
region_suffix2         = "west1"
use_bolla_prefix       = false
keys_bucket            = "db-keys-nl"
keys_bucket2           = "db-keys-be"
environment            = "dev" # in base al suo valore prende anche i progetti giusti. L'ambiente è giusto deciderlo in base al branch scelto a monte.

zones = {
  0 = "a"
  1 = "b"
  2 = "c"
}
zones2 = {
  0 = "a"
  1 = "b"
  2 = "d"
}

bucket              = "tlp-deployment-shared-services"
image_project       = "tlp-shared-services"
dns_private_zone    = "dev-gcp-telepass-com"
jboss_image_name    = "ntt-rh87-auditd-falcon-jboss742-ojdk1-8-0-362-b09-20230203"
jboss_image_name731 = "ntt-rh79-eap-jboss731-2java-20210528"
tlpnet              = "tlpnet"
network_project     = "tlp-host-vpc-dev"
network_project2    = "tlp-host-vpc-dev"
telepass_domain     = "dev.gcp.telepass.com"

subnets_terra = {
  0 = "10.136.234.0/23"
  1 = "172.16.0.144/28"
  2 = "172.16.0.16/28"
  3 = "172.16.0.128/28"
  4 = "172.16.0.112/28"
  5 = "172.16.0.160/28"
  6 = "10.148.84.64/28"
  7 = "172.16.0.224/28"
  8 = "35.235.240.0/20"
  9 = "10.136.104.0/22"
}

subnets_in_common = {
  0  = "10.113.0.0/16"
  1  = "10.136.0.0/16"
  2  = "10.153.0.0/16"
  3  = "10.136.124.0/23"
  4  = "10.136.228.0/23"
  5  = "10.136.136.0/22"
  6  = "10.136.140.0/28"
  7  = "10.136.230.0/23"
  8  = "10.136.240.0/20"
  9  = "10.136.232.0/23"
  10 = "10.65.0.0/16"
  11 = "10.67.0.0/16"
  12 = "172.16.0.240/28"
  13 = "10.136.128.0/23"
}

fortigate_routing = {
  "arcadoc"     = "172.17.48.240/28",
  "sia1"        = "193.178.204.1/32",
  "sia2"        = "185.41.166.36/32",
  "sia3"        = "193.178.204.12/32",
  "sia4"        = "193.178.207.12/32",
  "sia5"        = "193.178.207.31/32",
  "sia6"        = "193.178.204.95/32",
  "sia7"        = "193.178.207.14/32",
  "eni"         = "10.255.255.1/32",
  "q8"          = "10.14.241.0/24",
  "q8-1"        = "10.14.242.0/24",
  "q8-2"        = "10.14.244.0/24",
  "q8-3"        = "10.202.221.120/32",
  "bloomfleet0" = "10.255.253.16/28",
  "bloomfleet1" = "172.17.49.176/28",
  "bnl1"        = "10.238.35.160/32",
  "bnl2"        = "10.238.35.182/32",
  "bnl3"        = "10.238.33.97/32",
  "bnl4"        = "10.237.154.150/32",
  "bnl5"        = "10.237.154.151/32",
  "bnl6"        = "10.238.199.11/32",
  "bnl7"        = "10.238.199.12/32",
  "bnl8"        = "10.238.199.45/32",
  "bnl9"        = "10.238.199.47/32",
  "bnl10"       = "10.237.155.123/32",
  "bnl11"       = "10.237.155.124/32",
  "infogroup"   = "172.17.48.56/29",
}

ntt_rh85_lvm_auditd  = "ntt-rh85-lvm-cisv2-auditd-db2-115-20220318"
ntt_rh85_lvm_auditd1 = "ntt-rh85-lvm-cisv2-auditd-db2-115-20220525"
ntt_rh85_lvm_auditd2 = "ntt-rh85-lvm-cisv2-auditd-cdc-20220411"

ip_addresses_terra = {}