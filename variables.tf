variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "us-east1-b"
}

variable "ssh_user" {
  description = "Windows username (also SSH user)"
  type        = string
}
