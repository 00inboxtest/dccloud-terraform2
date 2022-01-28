locals {
  project_id = "custom-valve-332208"
  sa_id = format("%s-sa-%s", "var.gcp_project_id", var.suffix)
}

#resource "google_project_service" "project" {
#  project = local.project_id
#  service = "iam.googleapis.com"
#  disable_dependent_services = true
#}

resource "google_service_account" "gce_sa" {
  account_id   = local.sa_id
  display_name = local.sa_id
  timeouts {
    create = var.sa_timeout
  }
}

resource "google_project_iam_member" "spanner_role" {
  role   = "roles/spanner.viewer"
  member = "serviceAccount:${google_service_account.gce_sa.email}"
}

data "google_client_config" "google_client" {}