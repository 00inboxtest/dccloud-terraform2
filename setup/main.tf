locals {
  suffix = format("%s-%s", "tf", "2")
}

#module "service_enable" {
#  source = "../modules/service_enable"
#  gcp_project_id   = var.gcp_project_id
#}

#module "gce" {
#  source           = "../modules/gce"
#  suffix           = local.suffix
#  gcp_project_id   = var.gcp_project_id
#  vpc_network_name = "default"
#  instance_name    = "kylo-ren"
#  network_tags     = ["http-server", "https-server"]
#}

#module "iam" {
#  source           = "../modules/iam"
#}

#module "vpc2" {
#  source           = "../modules/vpc2"
#}

#module "custom-vpc" {
#  source           = "../modules/vpc"
# network_name     = "terraform-networks"
#  subnetwork_name  = "terraform-subnetworks"
#  region           = "europe-west1"
#  ip_cidr_range    = "10.2.0.0/16"
#}

#module "sa" {
#  source = "../modules/sa"
#}

# for New service account
#module "service_account" {
#  source           = "../modules/sa"
#  instance_name    = "kylo-ren"
#  rajpal           = "kylo-rajpal"
#  suffix           =  local.suffix
#  gcp_project_id   = var.gcp_project_id
#}
