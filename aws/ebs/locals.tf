locals {
  include_count_in_ebs_name = var.include_count_in_ebs_name || var.node_start_number != "1"
}
