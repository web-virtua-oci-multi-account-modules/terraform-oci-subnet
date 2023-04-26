output "subnet" {
  description = "Subnet"
  value       = oci_core_subnet.create_subnet
}

output "subnet_id" {
  description = "Subnet ID"
  value       = oci_core_subnet.create_subnet.id
}
