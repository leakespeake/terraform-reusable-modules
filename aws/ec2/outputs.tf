# This module uses the 'count' parameter so we now have a array of resources
# As such we must specify either the individual index in the array [0],[1],[2] or use the [*] splat expression to output all values

output "ipaddress" {
  value = aws_instance.my-ec2-instance[*].private_ip
}

output "instance_id" {
  value = aws_instance.my-ec2-instance[*].id
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.my-ec2-instance[*].private_ip
}  
