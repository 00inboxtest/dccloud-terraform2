terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

locals {
  region        = data.google_client_config.google_client.region
  zone          = format("%s-%s", local.region, var.zone)
  sa_id = format("%s-sa-%s", "Tf", var.suffix)
}

resource "google_project_service" "compute_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "networking_api" {
  service            = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}

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
