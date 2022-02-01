locals {
  suffix = format("%s-%s", "tf", "2")
}
######### service enbale #######
module "service_enable" {
  source = "../modules/service_enable"
  gcp_project_id   = var.gcp_project_id
}

########### custom VPC creation ###########
module "custom-vpc" {
  source           = "../modules/vpc"
  network_name     = "terraform-networks"
  subnetwork_name  = "terraform-subnetworks"
  region           = "europe-west1"
  ip_cidr_range    = "10.2.0.0/16"
}

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

#module "vpc2" {
#  source           = "../modules/vpc2"
#}

###### vpc correction #######
module "vpc" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "~> 2.0.0"
    project_id   = "custom-valve-332208"
    network_name = "example-vpc"
    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-west1"
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]
    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]
    }
}
