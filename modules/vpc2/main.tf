## Create VPC
resource "google_compute_network" "vpc" {
     name                    = "${var.name}-vpc"
     auto_create_subnetworks = "false"
    }
    ## Create Subnet
 ##  Create public subnet  

resource "google_compute_subnetwork" "pub-subnet" {
     name          = "${var.name}-public-subnet"
     ip_cidr_range = "${var.pub-subnet-cidr}"
     network       = "${var.name}-vpc"
     depends_on    = ["google_compute_network.vpc"]
     region        = "us-east1"
    }

## Create private subnet

resource "google_compute_subnetwork" "private-subnet" {
     name          = "${var.name}-private-subnet"
     ip_cidr_range = "${var.private-subnet-cidr}"
     network       = "${var.name}-vpc"
     depends_on    = ["google_compute_network.vpc"]
     region        = "us-east1"
     private_ip_google_access = "true"
    }