locals {
  suffix = format("%s", var.suffix)
  account_name  = format("%s", var.instance_name)
}

#resource "google_project_service" "project" {
#  project = var.gcp_project_id
#  service = "iam.googleapis.com"
#  disable_dependent_services = true
#}

resource "google_service_account" "gce_sa" {
  account_id   = var.instance_name
  display_name = var.instance_name
  timeouts {
    create = var.sa_timeout
  }
}

resource "google_project_iam_member" "spanner_role" {
  role   = "roles/spanner.viewer"
  member = "serviceAccount:${google_service_account.gce_sa.email}"
}

resource "google_project_iam_member" "editor" {
  role   = "roles/editor"
  member = "serviceAccount:${google_service_account.gce_sa.email}"
}

resource "google_project_iam_member" "editor" {
  role   = "roles/owner"
  member = "serviceAccount:${google_service_account.gce_sa.email}"
}
data "google_client_config" "google_client" {}