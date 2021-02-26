# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

# Only required when creating a new zone - otherwise append new records to existing zones using the 'route53records' module
variable "domain_name" {
  description = "Route 53 domain name to register with AWS"
  type        = string  
}
