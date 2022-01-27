resource "google_project_service" "project" {
  project = "var.gcp_project_id"
  service = "iam.googleapis.com"
  disable_dependent_services = true
}

resource "google_service_account" "service_account" {
  account_id   = "testRajpal"
  display_name = "Service Account"
}