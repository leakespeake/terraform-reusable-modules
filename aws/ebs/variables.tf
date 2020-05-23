variable "node_count" {}

variable "node_start_number" {
  default = 1
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'sc1' or 'st1'"
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "The size of the volume in GB"
  default     = 20
}

variable "azs" {
  description = "deploy these EBS volumes in these Availability Zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "environment" {
  type        = string
  description = "Environment of the EBS volume e.g. dev, stage or production"
}

variable "owner" {
  type        = string
  description = "Owner of the EBS volumes. The name of this variable will be given when you have onboarded on "
}

variable "app" {
  type        = string
  description = "Name of application hosted on attached to the volume - e.g. Cassandra"
}

variable "include_count_in_ebs_name" {
  description = "should the count be appended to the ebs name? e.g. myvolume01 vs myvolume. setting this to false has no effect when master_count is greater than 1"
  default     = true
}
