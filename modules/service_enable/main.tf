# i am service enable
resource "google_project_service" "project" {
  project = var.gcp_project_id
  service = "iam.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

#serviceusage.googleapis.com
resource "google_project_service" "serviceusage" {
  project = var.gcp_project_id
  service = "serviceusage.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}

resource "google_project_service" "compute_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "networking_api" {
  service            = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}