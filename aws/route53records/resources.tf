resource "aws_route53_record" "demo_dns_record" {
  # utilize the 'count' parameter to create an array of resources
  count   = var.node_count
  # utilize {count.index + 1} to start the sequential numbering from '01' in the array index (not '00')
  name    = "${var.node_name}-0${count.index + 1}.${var.dns_domain}"
  zone_id = data.aws_route53_zone.leakespeake-com.zone_id
  type    = var.type
  ttl     = var.ttl
  records = var.record_data
}