output "elastic_address" {
  value = "${aws_eip.demo-eip.public_ip}"
}
