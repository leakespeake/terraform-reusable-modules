resource "aws_route53_record" "demo_dns_record" {
  name    = "${var.node_name}.${var.dns_domain}"
  zone_id = data.aws_route53_zone.leakespeake-com.zone_id
  type    = var.type
  ttl     = var.ttl
  records = var.record_data
}