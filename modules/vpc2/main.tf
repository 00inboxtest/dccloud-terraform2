
resource "google_compute_network" "vpc_network" {
  name = "terraform-networkss"
}

resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetworks"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}