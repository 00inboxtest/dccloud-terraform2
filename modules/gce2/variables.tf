## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}


variable "zone" {
  type        = string
  default     = "b"
  description = "The zone that the machine should be created in."
}

variable "network_tags" {
  type        = list(string)
  default     = []
  description = "A list of network tags to attach to the instance."
}

variable "vpc_network_name" {
  type        = string
  default     = "default"
  description = "Virtual Private Cloud in which GCE VM Instance would be created. If you have custom VPC network, supply VPC Network Name."
}

variable "sa_timeout" {
  type        = string
  default     = "10m"
  description = "How long a Service Account creation operation is allowed to take before being considered a failure."
}
