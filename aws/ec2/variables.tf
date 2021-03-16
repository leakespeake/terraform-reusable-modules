# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

# use a locals {} block in the root module to apply this value to all EC2 resources in this stack
variable "node_count" {
  description = "The number of nodes to deploy"
  type        = number 
  default     = 1
}

# use a locals {} block in the root module to apply this value to all EC2 resources in this stack
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

variable "public_ip" {
  description = "Associate an ethemeral public ip address with an instance in a VPC - or - use the aws_eip resource for a static Elastic IP"
  default     = false
}	

variable "machine_ami" {
  description = "AMI ID of the image you want to use. The ID must be available in the region you are deploying to"
  type        = string
}

variable "aws_instance_type" {
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
  type        = string
  default	    = "t2.micro"
}

variable "key_name" {
  description = "Name the public key you want to use to ssh to the new instance. You must have the associated private key in your local .ssh folder"
  type        = string
}

variable "root_volume_type" {
  description = "The type of EBS volume - standard (magnetic), general purpose ssd (gp2), iops ssd (io1), cold hdd (sc1), throughput optimized hdd (st1)"
  type        = string
  default     = "standard"
}

variable "root_volume_size" {
  description = "The size of the volume in GB"
  type        = number
  default     = 10
}

# LOAD CORRECT TEMPLATEFILE FOR USER_DATA (match to the machine AMI chosen)

variable "user_data" {
  description = "The userdata used to bootstrap the node"
  type        = string
}

variable "os_distro" {
  description = "Choose 'centos' or 'ubuntu' to load the appropriate templatefile"
  type        = string
}

variable "file_ext" {
  description = "Choose 'sh' or 'yaml' to load the appropriate templatefile"
  type        = string
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

# KEY PAIR VARIABLES

variable "public_key" {
  description = "The public key string to use to ssh to the instances. You must have the associated private key in your local .ssh folder"
  type        = string
}

# SECURITY GROUP VARIABLES

variable "security_group_name" {
  description = "The name of your Security Group"
  type = string
}

# pass to templatefile for variable interpolation (user_data bootstrap script)
variable "service_port1" {
  description = "The first port intended to allow access to the running service - add additional as required _port2, _port3 etc"
  type        = number
  #default     = null
}

# pass to templatefile for variable interpolation (user_data bootstrap script) 
variable "access_port" {
  description = "SSH"
  type        = number
  #default     = 22
}

# pass to templatefile for variable interpolation (user_data bootstrap script) 
variable "docker_api_port" {
  description = "The remote Docker API - allowing comms to the Docker daemon"
  type        = number
  #default     = 2376
}