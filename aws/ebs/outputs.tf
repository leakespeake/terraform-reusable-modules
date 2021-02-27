# This module uses the 'count' parameter so we now have a array of resources
# As such we must specify either the individual index in the array [0],[1],[2] or use the [*] splat expression to output all values

output "volume_id" {
  value = aws_ebs_volume.instance_ebsv[*].id
}
