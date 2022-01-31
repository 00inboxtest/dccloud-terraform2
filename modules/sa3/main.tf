
locals {
  project_id = "custom-valve-332208"
}

############################
# SERVICE ACCOUNT (OPTIONAL)
############################
# Note: The user running terraform needs to have the IAM Admin role assigned to them before you can do this.

resource "google_project_iam_custom_role" "my-instance-role" {
  role_id     = "myInstanceRole"
  title       = "My Instance Role"
  description = "my custom iam role"
  permissions = [
    "storage.objects.create", 
    "cloudkms.cryptoKeyVersions.useToEncrypt"
  ]
}