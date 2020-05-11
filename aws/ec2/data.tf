# Load the contents of the template file (bootstrap.sh) and state the variables for interpolation within the template (DRY)
data "template_file" "user_data" {
  template = file("${path.module}/bootstrap.sh")

  vars = {
    service_port1 = var.service_port1
  }
}