resource "google_compute_network" "vpc_network" {
  project                 = "custom-valve-332208"
  name                    = "vpc-network"
  auto_create_subnetworks = true
  mtu                     = 1460
}