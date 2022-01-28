locals {
  project_id = "custom-valve-332208"
}

resource "google_project_service" "project" {
  project = local.project_id
  service = "iam.googleapis.com"
  disable_dependent_services = true
}

#resource "google_service_account" "sa-name" {
#  account_id = "devtest"
#  display_name = "Service Account"
#}

#resource "google_project_iam_member" "iam" {
#  project = local.project_id
  #role    = ["roles/storage.admin","roles/compute.networkAdmin"]
#  role    = "roles/compute.networkAdmin"
#  member  = "serviceAccount:${google_service_account.sa-name.email}"
#}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_service_account" "sa" {
  account_id   = "my-service-account"
  display_name = "A service account that only Jane can interact with"
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  policy_data        = data.google_iam_policy.admin.policy_data
}
