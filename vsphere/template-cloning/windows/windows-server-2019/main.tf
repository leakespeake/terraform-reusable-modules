resource "vsphere_virtual_machine" "vm" {
  # use the length function to return the number of items in the 'ipv4' array - see variables.tf - or simply use var.node_count
  count            = length(var.ipv4)
  # utlize {count.index + 1} to start the sequential numbering from '01' in the array index (not '00')
  name             = "${var.vmname}-0${count.index + 1}.${var.vmnamesuffix}"

  folder           = var.folder
  num_cpus         = var.cpus
  memory           = var.memory

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  # Changing any option in 'clone' after creation forces a new resource
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    # Windows guests are customized using Sysprep, resulting in the machine SID being reset
    customize {
      windows_options {
        computer_name     = "${var.vmname}-0${count.index + 1}"
        workgroup         = var.workgroup
        admin_password    = var.admin_password
        organization_name = var.orgname
      }

      # utlize [count.index] for 'ipv4_address' to iterate through the items in the 'ipv4' array - see variables.tf
      network_interface {
        ipv4_address = var.ipv4[count.index]
        ipv4_netmask = var.ipv4_mask
      }
      # utlize the ["slu"] or ["hhe"] keys to lookup the corresponding DNS values in the MAP variable
      ipv4_gateway    = var.ipv4_gateway
	  dns_server_list = var.dns_servers
    }
  }
}





