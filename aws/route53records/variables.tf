variable "node_count" {}

variable "node_start_number" {
  default = 1
}

variable "node_name" {
  type        = string
  description = "Base name of the node - e.g. myinstance"
}

variable "zone_id" {
  type        = string
  description = "The Zone ID of the DNS Zone you wish to create a DNS record against. This must already be created and registered"
}

variable "type" {
  type        = string
  description = "The type of record you want to create (e.g. A, MX, CNAME ...)"
}

variable "dns_domain" {
  type        = string
  description = "Domain name of the DNS Zone you are creating A records to - e.g. demo01.leakespeake.com"
}

variable "ttl" {
  description = "The TTL of the record."
  default     = 300
}

variable "include_count_in_hostname" {
  description = "should the count be appended to the basename? e.g. myvm01 vs myvm. setting this to false has no effect when master_count is greater than 1"
  default     = true
}

variable "record_data" {
  type        = list(string)
  description = "The Elastic IPs - computed attributes when creating ec2 instances"
}
