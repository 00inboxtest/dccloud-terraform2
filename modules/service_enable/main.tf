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
resource "google_project_service" "project" {
  project = var.gcp_project_id
  service = "serviceusage.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_dependent_services = true
}


