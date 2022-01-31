## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  default     = "custom-valve-332208"
  description = "Id of the GCP project"
}

variable "region" {
  type        = string
  default     = "europe-west1"
  description = "Region where the GCE VM Instance resides. Defaults to the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones"
}

variable "account_name" {
  type        = string
  description = "Service Account"
}
