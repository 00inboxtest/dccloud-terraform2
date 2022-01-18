terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

module "vpc" {
    source = "github.com/terraform-google-modules/terraform-google-network"
    project_id   = var.gcp_project_id
    network_name = var.vpc_network_name

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
            subnet_private_access = true
            subnet_flow_logs      = true
        },
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}