output "hostnames" {
  value = aws_route53_record.demo_dns_record.*.name
}
