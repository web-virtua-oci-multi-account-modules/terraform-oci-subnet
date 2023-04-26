locals {
  tags_subnet = {
    "tf-name"        = var.name
    "tf-type"        = "subnet"
    "tf-compartment" = var.compartment_name
  }
}

resource "oci_core_subnet" "create_subnet" {
  vcn_id                     = var.vcn_id
  compartment_id             = var.compartment_id
  route_table_id             = var.route_table_id
  display_name               = var.name
  cidr_block                 = var.cidr_block
  dns_label                  = var.dns_label
  dhcp_options_id            = var.dhcp_options_id
  security_list_ids          = var.security_list_ids
  availability_domain        = var.availability_domain
  ipv6cidr_block             = var.ipv6cidr_block
  ipv6cidr_blocks            = var.ipv6cidr_blocks
  prohibit_internet_ingress  = var.prohibit_internet_ingress
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic
  defined_tags               = var.defined_tags
  freeform_tags              = merge(var.tags, var.use_tags_default ? local.tags_subnet : {})
}
