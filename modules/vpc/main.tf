resource "google_compute_subnetwork" "network-for-l7lb" {
  provider = google-beta
  name          = "l7lb-test-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  network       = google_compute_network.custom-test.id
}
resource "google_compute_network" "custom-test" {
  provider = google-beta
  name                    = "l7lb-test-network"
  auto_create_subnetworks = false
}