# Lookup the datacenter
data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

# Lookup the datastore within the elected datacenter
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Lookup the cluster within the elected datacenter
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Lookup the network within the elected datacenter
data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Lookup the template and its UUID within the elected datacenter (for cloning), along with settings for network interface type, SCSI bus type and disk attributes
data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}