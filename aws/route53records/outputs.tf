# This module uses the 'count' parameter so we now have a array of resources
# As such we must specify either the individual index in the array [0],[1],[2] or use the [*] splat expression to output all values

output "hostnames" {
  value = aws_route53_record.demo_dns_record[*].name
}