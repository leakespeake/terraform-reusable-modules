# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

# use a locals {} block in the root module to apply this value to all EC2 resources in this stack
variable "node_count" {
  description = "The number of nodes to attach elastic ips to"
  default     = 1
}

variable "instances_ids" {
  description = "These ids are computed attributes when creating ec2 instances - pulled from the ec2 module"
  type        = list(string)
  default     = []
}

# TAG VARIABLES - use a locals {} block in the root module to apply these tag values to all EC2 resources in this stack

variable "owner" {
  description = "Owner of the instances"
  type        = string
  default     = "barry"
}

variable "environment" {
  description = "Environment that the instances reside - dev, stage or prod"
  type        = string
  default     = "stage"
}

variable "app" {
  description = "Name of application hosted on instances"
  type        = string
  default     = "nginx"
}
