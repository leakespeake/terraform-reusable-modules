# This module uses the 'count' parameter so we now have a array of resources
# As such we must specify either the individual index in the array [0],[1],[2] or use the [*] splat expression to output all values

output "vm_vsphere_name" {
  description = "The name(s) of the virtual machine(s) in vCenter server"
  value       = vsphere_virtual_machine.ubuntu-vm[*].name
}

output "vm_os_hostname" {
  description = "The Linux OS computer name(s) of the virtual machine(s)"
  value       = vsphere_virtual_machine.ubuntu-vm[*].clone.0.customize.0.linux_options.0.host_name
}

output "vm_ipv4_address" {
  description = "The IP(s) of the virtual machine(s)"
  value       = vsphere_virtual_machine.ubuntu-vm[*].clone.0.customize.0.network_interface.0.ipv4_address
}

output "vm_dns_server_list" {
  description = "The DNS servers for the virtual machine(s)"
  value       = vsphere_virtual_machine.ubuntu-vm[0].clone.0.customize.0.dns_server_list
}

output "vm_dns_record_name" {
  description = "The DNS A record for the virtual machine(s) - domain suffix appended by the DNS server"
  value       = dns_a_record_set.my-test-vms[*].name
}