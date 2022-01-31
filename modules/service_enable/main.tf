# i am service enable
resource "google_project_service" "project" {
  project = var.gcp_project_id
  service = "iam.googleapis.com"
  disable_dependent_services = true
}
