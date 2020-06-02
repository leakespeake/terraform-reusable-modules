# startup scripts for each OS instance - loaded by the template_file datasource for variable interpolation (DRY)
# to update list of available packages and their versions then upgrade installed packages to those versions
# also install and run a simple web service for testing purposes only

# base applications such as Docker CE and Python 3 should be baked into the Packer template (or deployed separately with Ansible)
# additional configuration to be done by Ansible to automate tasks specific for a nodes intended purpose

data "template_file" "user-data" {
  template = file("${path.module}/bootstrap-${var.os_distro}.sh")

  vars = {
    access_port   = var.access_port
    service_port1 = var.service_port1
  }
}
