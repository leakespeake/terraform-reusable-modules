# VSPHERE AUTHENTICATION

variable "vcenter_server" {
  type        = string
  description = "The vCenter server hostname, IP, or FQDN"
  default     = "vcsa.int.leakespeake.com"
}

variable "vcenter_username" {
  type        = string
  description = "The username for authenticating to vCenter"
  default     = "administrator@vsphere.local"
}

variable "vcenter_password" {
  type        = string
  description = "The password for authenticating to vCenter - no default set to allow for run time prompt"
}

# VSPHERE VARIABLES

variable "datacenter" {
  description = "The datacenter to deploy the VM"
  default     = "home-dc-01"
}

variable "datastore" {
  description = "The datastore to deploy the VM - check free space first!"
  default     = "NAS-datastore-01"
}

variable "cluster" {
  description = "The cluster to deploy the VM"
  default     = "home-cluster-01"
}

variable "network" {
  description = "The network to deploy to - must agree with IPs defined in var.ipv4 - options: [VM Network, 10.1.1.0/24_prd, 10.2.2.0/24_stg, 10.3.3.0/24_dhcp]"
  type        = string
  default     = "VM Network"

  validation {
    condition     = can(regex("VM Network|10.1.1.0/24_prd|10.2.2.0/24_stg|10.3.3.0/24_dhcp", var.network))
    error_message = "ERROR: Invalid vsphere network name - must be either VM Network, 10.1.1.0/24_prd, 10.2.2.0/24_stg or 10.3.3.0/24_dhcp."
  }
}

variable "template" {
  description = "The name of the template available on the selected vCenter server"
  default     = "ubuntu-server-20-04-2-20210916T123123Z"
}

variable "folder" {
  description = "The path to the folder to put the VM in, relative to the datacenter that the resource pool is in"
  default     = "Packer-vms"
}

# VM RESOURCE VARIABLES

variable "vmname" {
  description = "The base name of the resulting VM(s)"
  default     = "test-ubuntu"
}

variable "vmnamesuffix" {
  description = "The DNS domain suffix - to be appended to var.vmname - match to the Linux customization option 'domain'"
  default     = "int.leakespeake.com"
}

variable "cpus" {
  description = "The number of CPU (cores per CPU) for the VM"
  default     = 1
}

variable "memory" {
  description = "The RAM size in megabytes"
  default     = 2048
}

variable "nested_hv" {
  type        = bool
  description = "Enable or disable nested virtualization in the guest"
  default     = true
}

# VM RESOURCE CUSTOMIZATION VARIABLES

variable "domain" {
  description = "The domain name for this VM. This, along with host_name, make up the FQDN of this VM - match to the resource variable 'vmnamesuffix'"
  default     = "int.leakespeake.com"
}

variable "ipv4" {
  description = "The IP's to set for each VM - must exist within the var.network range. Used to calculate VM numbers via: count = length(var.ipv4)"
  type        = list(string)
  default     = ["10.1.1.85", "10.1.1.86"]
}

variable "ipv4_mask" {
  description = "The subnet mask of the ipv4 network"
  default     = "24"
}

variable "ipv4_gateway" {
  description = "The default gateway of the ipv4 network"
  type        = string
  default     = "10.1.1.1"

  validation {
    condition     = can(regex("192.168.0.250|10.1.1.1|10.2.2.1|10.3.3.1", var.ipv4_gateway))
    error_message = "ERROR: Invalid gateway address - must be either 192.168.0.250, 10.1.1.1, 10.2.2.1, or 10.3.3.1."
  }
}

variable "dns_servers" {
  description = "Set DNS configuration"
  type        = list(string)
  default     = ["192.168.0.113", "194.168.4.100", "194.168.8.100"]
}

# DNS A RECORD VARIABLES

variable "zone" {
  description = "DNS zone the record set belongs to. It must be an FQDN, include the trailing dot."
  default     = "int.leakespeake.com."
}

variable "ttl" {
  description = "The TTL of the record set. Normally defaults to 3600"
  default     = "300"
}

# DNS PROVIDER VARIABLES

variable "dns_server" {
  description = "The DNS server to register the A record entries against"
  default     = "win2019-dc01.int.leakespeake.com"
}

variable "dns_port" {
  description = "The DNS server port"
  default     = 53
}

variable "dns_transport" {
  description = "The DNS server transport type"
  default     = "tcp"
}
