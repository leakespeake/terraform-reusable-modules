output "ipaddress" {
  value = "${aws_instance.my-ec2-instance.*.private_ip}"
}

output "instance_id" {
  value = "${aws_instance.my-ec2-instance.*.id}"
}
