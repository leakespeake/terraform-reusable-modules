terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.0.2"
    }
    dns = {
      source  = "hashicorp/dns"
      version = "3.2.1"
    }
  }
  required_version = ">= 1.0.6"
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