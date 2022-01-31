locals {
  sa_id = format("%s-sa-%s", "terratests", var.suffix)
}

resource "google_service_account" "gce_sa" {
  account_id   = var.sa_name
  display_name = var.sa_name
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

data "google_client_config" "google_client" {}