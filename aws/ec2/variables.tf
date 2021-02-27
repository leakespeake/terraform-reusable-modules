# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

variable "node_count" {
  description = "The number of nodes to deploy"
  default     = 0
}

variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type        = list(string)
}

variable "aws_subnet_id" {
  description = "The subnet to run the EC2 Instances in - see var.private_ips"
  type        = string
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "private_ips" {
  description = "A list of private IP addresses to associate with the VPC instances - match the number of instances and the subnet CIDR"
  type        = list(string)
  default     = []
}	

variable "machine_ami" {
  description = "AMI ID of the image you want to use. The ID must be available in the region you are deploying to"
  type        = string
}

variable "aws_instance_type" {
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key name you want to use to ssh to the new instance. You must have the private key of the keyname you wish to use in your local .ssh folder"
  type        = string
}

variable "user_data" {
  description = "The userdata used to bootstrap the node"
  type        = string
}

variable "os_distro" {
  description = "Choose centos coreos or ubuntu to load the appropriate template file"
  type        = string
}

variable "file_ext" {
  description = "Choose sh or yaml to load the appropriate template file"
  type        = string
}

variable "public_ip" {
  description = "Associate a public ip address with an instance in a VPC"
  default     = false
}

variable "root_volume_type" {
  description = "The type of EBS volume - standard (magnetic), general purpose ssd (gp2), iops ssd (io1), cold hdd (sc1), throughput optimized hdd (st1)"
  type        = string
  default     = "standard"
}

variable "root_volume_size" {
  description = "The size of the volume in GB"
  default     = 10
}

# TAG VARIABLES

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

# KEY PAIR VARIABLES

variable "public_key" {
  description = "The public key you want to use to ssh to the instances you create. You must have the private key of the keyname you wish to use in your .ssh folder locally"
  type        = string
}

# SECURITY GROUP VARIABLES

variable "security_group_name" {
  description = "The name of your Security Group"
  type = string
}

variable "service_port1" {
  description = "The first port intended to allow access to the running service - add additional as required _port2, _port3 etc"
  type        = number
  default     = 8080
}

variable "access_port" {
  description = "SSH"
  type        = number
  default     = 22
}

variable "docker_api_port" {
  description = "The remote Docker API - allowing comms to the Docker daemon"
  type        = number
  default     = 2376
}