resource "aws_eip" "demo-eip" {
  instance  = var.instances_ids[count.index]
  vpc       = true
  count     = var.node_count

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}.${var.environment}"
    #Name        = "${var.app}.${var.environment}${local.include_count_in_eip_name ? format("%02d", count.index+var.node_start_number) : ""}"
  }
}
