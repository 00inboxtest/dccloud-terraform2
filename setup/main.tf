locals {
  suffix = format("%s-%s", "tf", "2")
}

######### service enbale #######
module "service_enable" {
  source = "../modules/service_enable"
  gcp_project_id   = var.gcp_project_id
}

########### custom VPC creation ###########
#module "custom-vpc" {
#  source           = "../modules/vpc"
#  network_name     = "terraformnetworks"
#  subnetwork_name  = "terraform-subnetworks"
#  region           = "europe-west1"
#  ip_cidr_range    = "10.2.0.0/16"
#}

######## compute instance creation #####
#module "gce" {
#  source           = "../modules/gce"
#  suffix           = local.suffix
#  gcp_project_id   = var.gcp_project_id
#  vpc_network_name = "terraform-networks"
#  instance_name    = "test"
#  network_tags     = ["http-server", "https-server"]
#}

######## for New service account creation #####
#module "service_account" {
#  source           = "../modules/sa"
#  account_name     = "dev-test"
#  suffix           =  local.suffix
#  gcp_project_id   = var.gcp_project_id
#}

#module "iam" {
#  source           = "../modules/iam"
#}

########### custom VPC creation ###########
module "custom-vpc" {
  source           = "../modules/vpc2"
  network_name     = "terraformnetworks"
  subnetwork_name  = "terraform-subnetworks"
  region           = "europe-west1"
  ip_cidr_range    = "10.2.0.0/16"
}
