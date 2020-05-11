# Providers

variable "region" {
  description = "The region to run the EC2 Instances in"
  default     = "us-east-2"
}

# EC2 Instance Variables

variable "node_count" {}

variable "node_start_number" {
  default = 1
}

variable "azs" {
  type        = string
  description = "The Availability Zone to run the EC2 Instances in"
}

variable "machine_ami" {
  type        = string
  description = "ami ID of the image you want to use. The ID must be available in the region you are deploying too"
}

variable "aws_instance_type" {
  type        = string
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "key_name" {
  type        = string
  description = "The key name you want to use to ssh to the instances you create. You must have the private key of the keyname you wish to use in your .ssh folder locally"
}

variable "user_data" {
  type        = string
  description = "userdata used to bootstrap the node"
}

variable "public_ip" {
  description = "Associate a public ip address with an instance in a VPC."
  default     = false
}

variable "root_volume_type" {
  type        = string
  description = "The type of EBS volume - standard (magnetic), general purpose ssd (gp2), iops ssd (io1), cold hdd (sc1), throughput optimized hdd (st1)"
  default     = "standard"
}

variable "root_volume_size" {
  description = "The size of the volume in GB"
  default     = 10
}


#TAG Variables

variable "owner" {
  type        = string
  description = "Owner of the instances"
}

variable "environment" {
  type        = string
  description = "Environment of the instance i.e. stage or production"
}

variable "app" {
  type        = string
  description = "Name of application hosted on instances - e.g. Cassandra"
}

variable "include_count_in_hostname" {
  description = "should the count be appended to the basename? e.g. myvm01 vs myvm. setting this to false has no effect when master_count is greater than 1"
  default     = true
}

# Key Pair Variables

variable "public_key" {
  type        = string
  description = "The public key you want to use to ssh to the instances you create. You must have the private key of the keyname you wish to use in your .ssh folder locally"
}


# Security Group Variables

variable "security_group_name" {
  description = "The name of your Security Group"
  type = string
}

variable "service_port1" {
  default = 8080
}

variable "access_port" {
  default = 22
}
