output "domain_name" {
  description = "Domain name of the hosted zone in Route 53"
  value       = var.domain_name
}

output "primary_public_zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.primary.zone_id
}
