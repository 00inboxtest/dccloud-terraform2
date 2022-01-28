locals {
  suffix = format("%s-%s", "tf", "2")
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

# for New service account
module "sa" {
  source           = "../modules/sa2"
  suffix           = local.suffix
  gcp_project_id   = var.gcp_project_id
}

#module "sa" {
#  source = "../modules/sa2"
#}
