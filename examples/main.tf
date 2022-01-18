resource "random_string" "launch_id" {
  length  = 4
  special = false
  upper   = false
}

locals {
  suffix = format("%s-%s", "tf", "2")
}

#module "kylo_ren" {
#  source           = "../modules/gce"
#  suffix           = local.suffix
#  gcp_project_id   = var.gcp_project_id
#  vpc_network_name = "default"
#  instance_name    = "kylo-ren"
#  network_tags     = ["http-server", "https-server"]
#}

#module "custom-vpc" {
#  source           = "../modules/vpc2"
#  gcp_project_id   = "custom-valve-332208"
#  vpc_network_name = "custom-vpc2"
#}

module "management_network" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/gruntwork-io/terraform-google-network.git//modules/vpc-network?ref=v0.1.2"
  
  source = "../modules/vpc2"
  name_prefix = "devTest"
  project     = "custom-valve-332208"
  region      = "us-east1"
}