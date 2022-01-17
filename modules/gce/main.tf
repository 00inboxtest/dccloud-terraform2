terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

locals {
  instance_name = format("%s-%s", var.instance_name, var.suffix)
  region        = data.google_client_config.google_client.region
  zone          = format("%s-%s", local.region, var.zone)
  network_tags  = tolist(toset(var.network_tags))

  name_static_vm_ip = format("%s-ext-ip-%s", var.instance_name, var.suffix)

  sa_id = format("%s-sa-%s", var.instance_name, var.suffix)
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

resource "google_compute_address" "gce_static_ip" {
  name       = local.name_static_vm_ip
  region     = local.region
  depends_on = [google_project_service.networking_api]

  timeouts {
    create = var.static_ip_timeout
    delete = var.static_ip_timeout
  }
}

data "google_client_config" "google_client" {}
