locals {
  suffix = format("%s-%s", "tf", "2")
  account_name     = "devTesting"
}

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

#module "vpc" {
#  source = "../modules/vpc"
#}

#module "sa" {
#  source = "../modules/sa"
#}

# for New service account
module "sa" {
  source           = "../modules/sa2"
  suffix           = local.suffix
  account_name     = local.account_name
  gcp_project_id   = var.gcp_project_id
}
