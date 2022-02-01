
resource "google_compute_network" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "public-subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
}