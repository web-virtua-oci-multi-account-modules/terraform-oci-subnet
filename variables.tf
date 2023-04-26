variable "vcn_id" {
  description = "VCN ID"
  type        = string
}

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}

variable "route_table_id" {
  description = "Route table ID"
  type        = string
}

variable "name" {
  description = "Subnet name"
  type        = string
}

variable "cidr_block" {
  description = "Cidr block to subnet"
  type        = string
}

variable "compartment_name" {
  description = "Compartment name"
  type        = string
  default     = null
}

variable "dns_label" {
  description = "DNS label"
  type        = string
  default     = ""
}

variable "security_list_ids" {
  description = "Rules to security list"
  type        = list(string)
  default     = null
}

variable "dhcp_options_id" {
  description = "DHCP options ID"
  type        = string
  default     = null
}

variable "availability_domain" {
  description = "Availability domain"
  type        = string
  default     = null
}

variable "ipv6cidr_block" {
  description = "IPV6 CIDR block"
  type        = string
  default     = null
}

variable "ipv6cidr_blocks" {
  description = "IPV6 CIDR blocks"
  type        = list(string)
  default     = null
}

variable "prohibit_internet_ingress" {
  description = "Prohibit internet ingress"
  type        = bool
  default     = null
}

variable "prohibit_public_ip_on_vnic" {
  description = "Prohibit public IP on VNIC"
  type        = bool
  default     = null
}

variable "use_tags_default" {
  description = "If true will be use the tags default to resources"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to VCN"
  type        = map(any)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags to VCN"
  type        = map(any)
  default     = null
}
