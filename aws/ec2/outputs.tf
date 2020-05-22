output "ipaddress" {
  value = "${aws_instance.my-ec2-instance.*.private_ip}"
}

output "instance_id" {
  value = "${aws_instance.my-ec2-instance.*.id}"
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.my-ec2-instance.*.private_ip
}  
