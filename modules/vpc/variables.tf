variable "network_name" {
  type        = string
  description = "Network name"
}

variable "subnetwork_name" {
  type        = string
  description = "Sub Network name"
}

variable "region" {
  type        = string
  description = "Region for networks"
}

variable "ip_cidr_range" {
  type        = string
  description = "ip cidr range"
}
