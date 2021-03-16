resource "aws_ebs_volume" "instance_ebsv" {
  # utilize the 'count' parameter to create an array of resources
  count             = var.node_count
  
  # use the 'element' function to iterate through the var.azs list to retrieve a different availability zone value each time
  # will wrap around if 'count' exceeds the number of list items
  availability_zone = element(var.azs, count.index)
  
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = {
    owner       = var.owner
    environment = var.environment
    app         = "${var.app}-${var.environment}"
  }
}
