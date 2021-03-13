# VSPHERE AUTHENTICATION

variable "vcenter_server" {
  description = "The vCenter server to use for our template clone operation and VM deployment(s)"
  default     = "ENTER"
}

variable "vcenter_username" {
  description = "The vCenter server username"
  default     = "ENTER"
  sensitive = true
}

variable "vcenter_password" {
  description = "The vCenter server password"
  sensitive = true
}

# VSPHERE VARIABLES

variable "datacenter" {
  description = "The datacenter to deploy the VM"
  default     = "ENTER"
}

variable "datastore" {
  description = "The datastore to deploy the VM - check free space first!"
  default     = "ENTER"
}

variable "cluster" {
  description = "The cluster to deploy the VM"
  default     = "ENTER"
}

variable "network" {
  description = "The network to deploy the VM"
  default     = "ENTER"
}

variable "template" {
  description = "The name of the template available on the selected vCenter server"
  default     = "ENTER"
}

variable "folder" {
  description = "The path to the folder to put the VM in, relative to the datacenter that the resource pool is in"
  default     = "vm"
}

# RESOURCE VARIABLES

variable "node_count" {
  description = "The number of instances you want deploy from the template"
  default     = 1
}

variable "vmname" {
  description = "The base name of the resulting VM(s)"
  default     = "my-vm"
}

variable "vmnamesuffix" {
  description = "The DNS domain suffix - to be appended to var.vmname"
  default     = "leakespeake.local"
}

variable "cpus" {
  description = "The number of CPU (cores per CPU) for the VM"
  default     = 2
}

variable "memory" {
  description = "The RAM size in megabytes"
  default     = 4096
}

# RESOURCE CUSTOMIZATION VARIABLES

variable "workgroup" {
  description = "The workgroup name for this VM"
  default     = "test"
}

variable "admin_password" {
  description = "The administrator password for this VM"
  default     = null
}

variable "orgname" {
  description = "The organization name for this VM"
  default     = "Leakespeake"
}

variable "ipv4" {
  description = "The IP addresses to set for each VM - must exist within the var.network range"
  type = list(string)
  default = ["ENTER", "ENTER"]
}

variable "ipv4_mask" {
  description = "The subnet mask of the ipv4 network"
  default = "24"
}

variable "ipv4_gateway" {
  description = "The default gateway of the ipv4 network"
  default = "ENTER"
}

variable "dns_servers" {
  description = "Set DNS configuration"
  type = list(string)
  default = ["ENTER", "ENTER", "ENTER"]
}