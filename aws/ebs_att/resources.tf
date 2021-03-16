resource "aws_volume_attachment" "instance_ebsv_att" {
  # utilize the 'count' parameter to create an array of resources
  count        = var.node_count
  
  device_name  = var.device_name
  volume_id    = var.volume_ids[count.index]
  instance_id  = var.instances_ids[count.index]
  skip_destroy = true
}
