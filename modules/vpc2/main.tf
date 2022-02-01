resource "google_compute_network" "vpc1" {
  name = "production-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "lab1"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc1.id
}


resource "google_compute_subnetwork" "subnet2" {
  name          = "lab2"
  ip_cidr_range = "10.1.0.0/24"
  region        = "asia-southeast1"
   network       = google_compute_network.vpc2.id
}