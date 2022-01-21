locals {
  name             = "terraform-networks2"
  region           = "europe-west1"
  pub-subnet-cidr    = 10.2.0.0/16
}

## Create VPC
resource "google_compute_network" "vpc" {
     name                    = "${local.name}-vpc"
     auto_create_subnetworks = "false"
    }
    ## Create Subnet
 ##  Create public subnet  

resource "google_compute_subnetwork" "pub-subnet" {
     name          = "${local.name}-public-subnet"
     ip_cidr_range = "${local.pub-subnet-cidr}"
     network       = "${local.name}-vpc"
     depends_on    = ["google_compute_network.vpc"]
     region        = ${local.region}
    }

## Create private subnet

resource "google_compute_subnetwork" "private-subnet" {
     name          = "${local.name}-private-subnet"
     ip_cidr_range = "${local.private-subnet-cidr}"
     network       = "${local.name}-vpc"
     depends_on    = ["google_compute_network.vpc"]
     region        = ${local.region}
     private_ip_google_access = "true"
    }