
locals {
  project_id = "custom-valve-332208"
}

############################
# SERVICE ACCOUNT (OPTIONAL)
############################
# Note: The user running terraform needs to have the IAM Admin role assigned to them before you can do this.

resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A description"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}