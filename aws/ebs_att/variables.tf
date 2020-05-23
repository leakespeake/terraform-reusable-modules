variable "node_count" {}

variable "instances_ids" {
  type        = list
  description = "These ids are computed attributes when creating ec2 instances. They must be known beforehand"
  default     = []
}

variable "volume_ids" {
  type        = list
  description = "These ids are computed attributes when creating ebs volumes. They must be known beforehand"
  default     = []
}

variable "device_name" {
  type = string
  description = "The device name to expose to the instance (for example, /dev/sdh or xvdh)"
  default = "/dev/xvdb"
}