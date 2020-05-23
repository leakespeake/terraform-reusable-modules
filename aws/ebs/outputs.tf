output "volume_id" {
  value = "${aws_ebs_volume.instance_ebsv.*.id}"
}
