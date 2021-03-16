resource "aws_eip" "demo-eip" {
  # utilize the 'count' parameter to create an array of resources
  count     = var.node_count
  
  # use the 'element' function to iterate through the var.instances_ids list to apply a different eip value to each instance in the array
  instance  = element(var.instances_ids, count.index)
  vpc       = true

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}-${var.environment}"
  }
}
