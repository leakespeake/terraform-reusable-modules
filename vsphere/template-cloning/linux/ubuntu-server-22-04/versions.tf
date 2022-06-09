terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.1.1"
    }
    dns = {
      source  = "hashicorp/dns"
      version = "3.2.3"
    }
  }
  required_version = ">= 1.2.2"
}

provider "vsphere" {
  vsphere_server       = var.vcenter_server
  user                 = var.vcenter_username
  password             = var.vcenter_password
  allow_unverified_ssl = true
}

provider "dns" {
  update {
    server    = var.dns_server
    port      = var.dns_port
    transport = var.dns_transport
    timeout   = 10
    retries   = 5
  }
}      