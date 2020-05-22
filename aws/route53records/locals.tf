locals {
  include_count_in_hostname = "${var.include_count_in_hostname || "${var.node_start_number}" != "1"}"
}
