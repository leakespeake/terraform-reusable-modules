# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

# use a locals {} block in the root module to apply this value to all EC2 resources in this stack
variable "node_count" {
  description = "The number of instances to deploy"
  type        = number
  default     = 1
}

# use a locals {} block in the root module to apply this value to all EC2 resources in this stack
variable "azs" {
  description = "Deploy these EBS volumes only in these Availability Zones"
  type        = list(string)
}

variable "ebs_volume_type" {
  description = "The type of EBS volume - standard (magnetic), general purpose ssd (gp2), iops ssd (io1), cold hdd (sc1), throughput optimized hdd (st1)"
  type        = string
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "The size of the volume in GB"
  type        = number
  default     = 20
}

# TAG VARIABLES - use a locals {} block in the root module to apply these tag values to all EC2 resources in this stack

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
