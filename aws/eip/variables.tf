variable "instances_ids" {
  type        = list(string)
  description = "These ids are computed attributes when created ec2 instances. They must be known beforehand"
  default     = []
}

variable "node_count" {
  description = "Number of nodes to attach elastic ips too."
  default     = 0
}

variable "node_start_number" {
  default = 1
}

#AWS TAG Variables

variable "owner" {
  type        = string
  description = "Owner of the instances. The name of this variable will be given when you have onboarded on "
}

variable "environment" {
  type        = string
  description = "Environment of the instance e.g. dev, stage or production"
}

variable "app" {
  type        = string
  description = "Name of application hosted on instances - e.g. Cassandra"
}

variable "include_count_in_eip_name" {
  description = "should the count be appended to the eip name? e.g. myvm01 vs myvm. setting this to false has no effect when master_count is greater than 1"
  default     = true
}
