## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  default     = "custom-valve-332208"
  description = "Id of the GCP project"
}

variable "region" {
  type        = string
  default     = "us-west1"
  description = "Region where the GCE VM .region  is specified here. See https://cloud.google.com/compute/docs/regions-zones"
}