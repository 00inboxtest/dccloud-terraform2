variable "suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "sa_timeout" {
  type        = string
  default     = "10m"
  description = "How long a Service Account creation operation is allowed to take before being considered a failure."
}

variable "gcp_project_id" {
  type        = string
  description = "Project in which GCE Resources will be created."
}

variable "instance_name" {
  type        = string
  description = "A unique name for the GCE resource. Changing this forces a new resource to be created."
}