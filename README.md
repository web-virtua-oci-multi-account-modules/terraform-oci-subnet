# OCI Subnet full for multiples accounts with Terraform module
* This module simplifies creating and configuring of Subnet full across multiple accounts on OCI

* Is possible use this module with one account using the standard profile or multi account using multiple profiles setting in the modules.

## Actions necessary to use this module:

* Criate file provider.tf with the exemple code below:
```hcl
provider "oci" {
  alias   = "alias_profile_a"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.ssh_private_key_path
  region           = var.region
}

provider "oci" {
  alias   = "alias_profile_b"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.ssh_private_key_path
  region           = var.region
}
```


## Features enable of Subnet configurations for this module:

- Subnet

## Usage exemples


### Create subnet with DNS label and one security list

```hcl
module "subnet" {
  source = "web-virtua-oci-multi-account-modules/subnet/oci"

  name           = "tf-subnet-test"
  cidr_block     = "10.1.100.0/24"
  dns_label      = "tftestsub"
  vcn_id         = var.network_dev_vcn_id
  compartment_id = var.network_dev_compartment_id
  route_table_id = var.network_dev_route_table_id

  security_list_ids = [
    var.security_list_id
  ]

  providers = {
    oci = oci.alias_profile_a
  }
}
```


## Variables

| Name | Type | Default | Required | Description | Options |
|------|-------------|------|---------|:--------:|:--------|
| vcn_id | `string` | `-` | yes | VCN ID | `-` |
| compartment_id | `string` | `-` | yes | Compartment ID | `-` |
| route_table_id | `string` | `-` | yes | route table ID | `-` |
| name | `string` | `-` | yes | Subnet name | `-` |
| cidr_block | `string` | `-` | yes | Cidr block to VCN | `-` |
| compartment_name | `string` | `-` | no | Compartment name | `-` |
| dns_label | `string` | `null` | no | DNS label | `-` |
| security_list_ids | `list(object)` | `null` | no | Rules to security list | `-` |
| dhcp_options_id | `string` | `null` | no | DHCP options ID | `-` |
| availability_domain | `string` | `null` | no | Availability domain | `-` |
| ipv6cidr_block | `string` | `null` | no | IPV6 CIDR block | `-` |
| ipv6cidr_blocks | `list(string)` | `null` | no | IPV6 CIDR blocks | `-` |
| prohibit_internet_ingress | `bool` | `null` | no | Prohibit internet ingress | `*`false <br> `*`true |
| prohibit_public_ip_on_vnic | `bool` | `null` | no | Prohibit public IP on VNIC | `*`false <br> `*`true |
| use_tags_default | `bool` | `true` | no | If true will be use the tags default to resources | `*`false <br> `*`true |
| tags | `map(any)` | `{}` | no | Tags to subnet | `-` |
| defined_tags | `map(any)` | `{}` | no | Defined tags to subnet | `-` |


## Resources

| Name | Type |
|------|------|
| [oci_core_subnet.create_subnet](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet) | resource |

## Outputs

| Name | Description |
|------|-------------|
| `subnet` | Subnet |
| `subnet_id` | Subnet ID |
