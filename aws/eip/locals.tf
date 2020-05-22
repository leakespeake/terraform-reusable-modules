locals {
  include_count_in_eip_name = "${var.include_count_in_eip_name || "${var.node_start_number}" != "1"}"
}
