resource "aws_ebs_volume" "instance_ebsv" {
  count             = var.node_count
  availability_zone = element(var.azs, count.index)
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}-${var.environment}"
  }
}
