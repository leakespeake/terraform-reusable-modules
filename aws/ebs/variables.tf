# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

variable "node_count" {
  description = "The number of instances to deploy"
  default = 1
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of EBS volume - 'standard', 'gp2', 'io1', 'sc1' or 'st1'"
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "The size of the volume in GB"
  default     = 20
}

variable "azs" {
  description = "Deploy these EBS volumes only in these Availability Zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

# TAG VARIABLES

variable "owner" {
  description = "Owner of the EBS volumes"
  type        = string
  default     = "barry"
}

variable "environment" {
  description = "Environment that the EBS volume resides - dev, stage or prod"
  type        = string
  default     = "stage"
}

variable "app" {
  description = "Name of application hosted on the EBS volume"
  type        = string
  default     = "nginx"
}
