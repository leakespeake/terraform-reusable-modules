resource "aws_route53_zone" "primary" {
  name    = var.domain_name
  comment = "Public zone for ${var.domain_name}"
}
