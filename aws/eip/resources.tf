resource "aws_eip" "demo-eip" {
  instance  = element(var.instances_ids, count.index)
  count     = var.node_count
  vpc       = true

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}-${var.environment}"
  }
}
