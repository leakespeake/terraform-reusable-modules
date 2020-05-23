resource "aws_ebs_volume" "instance_ebsv" {
  count             = var.node_count
  availability_zone = element(var.azs, count.index)
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = {
    owner       = var.owner
    environment = var.environment
    App         = "${var.app}.${var.environment}"
    Name        = "${var.app}.${var.environment}${local.include_count_in_ebs_name ? format("%02d", count.index+var.node_start_number) : ""}"
  }
}
