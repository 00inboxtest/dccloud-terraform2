resource "random_string" "launch_id" {
  length  = 4
  special = false
  upper   = false
}

locals {
  suffix = format("%s-%s", "tf", '12')
}

#module "kylo_ren" {
#  source           = "../modules/gce"
#  suffix           = local.suffix
#  gcp_project_id   = var.gcp_project_id
#  vpc_network_name = "default"
#  instance_name    = "kylo-ren"
#  network_tags     = ["http-server", "https-server"]
#}


######## for New VPC module create

module "vpc" {
  source           = "../modules/vpc"
  suffix           = local.suffix
  gcp_project_id   = var.gcp_project_id
  vpc_network_name = "default"
  instance_name    = "palpatine"
  network_tags     = ["http-server", "https-server"]
}
