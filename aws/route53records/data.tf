# Use the aws_route53_zone data source to look up a hosted dns zone
data "aws_route53_zone" "leakespeake-com" {
  zone_id = "Z00447873ABJW6QTXIUIH"
}