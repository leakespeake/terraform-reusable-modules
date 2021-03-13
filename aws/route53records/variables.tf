# PROVIDER VARIABLES

variable "region" {
  description = "The region to set for the aws provider in versions.tf"
  type        = string
  default     = "eu-west-2"
}

# RESOURCE VARIABLES

variable "node_name" {
  description = "The base name of the resulting VM(s)"
  type        = string
  default     = "demo"
}

variable "type" {
  description = "The type of record to create (A, MX, CNAME, AAAA etc)"
  type        = string
  default     = "A"
}

variable "dns_domain" {
  description = "The domain name of the DNS zone you are creating records in"
  type        = string
  default     = "leakespeake.com"
}

variable "ttl" {
  description = "The TTL of the record"
  default     = 300
}

variable "record_data" {
  description = "The Elastic IPs - computed attributes when creating ec2 instances"
  type        = list
  default     = []
}