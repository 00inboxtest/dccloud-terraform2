resource "google_compute_network" "custom-test" {
  provider = google-beta
  name                    = "l7lb-test-network"
  auto_create_subnetworks = false
}