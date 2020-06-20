output "domain_name" {
  value       = "${var.domain_name}"
  description = "Domain name for the hosted zoned in R53."
}

output "primary_public_zone_id" {
  value       = "${aws_route53_zone.primary.zone_id}"
  description = "R53 hosted zone ID."
}