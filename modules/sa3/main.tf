
locals {
  project_id = "custom-valve-332208"
}

############################
# SERVICE ACCOUNT (OPTIONAL)
############################
# Note: The user running terraform needs to have the IAM Admin role assigned to them before you can do this.

resource "google_service_account" "instance_admin" { 
  account_id   = "instance-admin"
  display_name = "instance s-account"
  }

 resource "google_project_iam_binding" "instance_sa_iam" {
  project = local.project_id
  role    = "roles/compute.instanceAdmin.v1"
  members = [
    "serviceAccount:${google_service_account.instance_admin.email}"
  ]
 }