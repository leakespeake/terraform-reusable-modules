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

variable "instances_ids" {
  description = "These ids are computed attributes when creating ec2 instances"
  type        = list
  default     = []
}

variable "volume_ids" {
  description = "These ids are computed attributes when creating ebs volumes"
  type        = list
  default     = []
}

variable "device_name" {
  description = "The device name to expose to the instance, such as /dev/sdh or xvdh"
  type = string
  default = "/dev/xvdb"
}