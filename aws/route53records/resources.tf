resource "aws_route53_record" "demo_dns_record" {
  count   = var.node_count
  zone_id = var.zone_id
  name    = "${var.node_name}${local.include_count_in_hostname ? format("%02d", count.index+var.node_start_number) : ""}.${var.dns_domain}"
  type    = var.type
  ttl     = var.ttl
  records = var.record_data 
  #records = var.record_data[count.index]
}
