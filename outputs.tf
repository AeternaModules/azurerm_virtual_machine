output "virtual_machines" {
  description = "All virtual_machine resources"
  value       = azurerm_virtual_machine.virtual_machines
  sensitive   = true
}
output "virtual_machines_additional_capabilities" {
  description = "List of additional_capabilities values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.additional_capabilities]
}
output "virtual_machines_availability_set_id" {
  description = "List of availability_set_id values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.availability_set_id]
}
output "virtual_machines_boot_diagnostics" {
  description = "List of boot_diagnostics values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.boot_diagnostics]
}
output "virtual_machines_delete_data_disks_on_termination" {
  description = "List of delete_data_disks_on_termination values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.delete_data_disks_on_termination]
}
output "virtual_machines_delete_os_disk_on_termination" {
  description = "List of delete_os_disk_on_termination values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.delete_os_disk_on_termination]
}
output "virtual_machines_identity" {
  description = "List of identity values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.identity]
}
output "virtual_machines_license_type" {
  description = "List of license_type values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.license_type]
}
output "virtual_machines_location" {
  description = "List of location values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.location]
}
output "virtual_machines_name" {
  description = "List of name values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.name]
}
output "virtual_machines_network_interface_ids" {
  description = "List of network_interface_ids values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.network_interface_ids]
}
output "virtual_machines_os_profile" {
  description = "List of os_profile values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.os_profile]
  sensitive   = true
}
output "virtual_machines_os_profile_linux_config" {
  description = "List of os_profile_linux_config values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.os_profile_linux_config]
}
output "virtual_machines_os_profile_secrets" {
  description = "List of os_profile_secrets values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.os_profile_secrets]
}
output "virtual_machines_os_profile_windows_config" {
  description = "List of os_profile_windows_config values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.os_profile_windows_config]
  sensitive   = true
}
output "virtual_machines_plan" {
  description = "List of plan values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.plan]
}
output "virtual_machines_primary_network_interface_id" {
  description = "List of primary_network_interface_id values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.primary_network_interface_id]
}
output "virtual_machines_proximity_placement_group_id" {
  description = "List of proximity_placement_group_id values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.proximity_placement_group_id]
}
output "virtual_machines_resource_group_name" {
  description = "List of resource_group_name values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.resource_group_name]
}
output "virtual_machines_storage_data_disk" {
  description = "List of storage_data_disk values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.storage_data_disk]
}
output "virtual_machines_storage_image_reference" {
  description = "List of storage_image_reference values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.storage_image_reference]
}
output "virtual_machines_storage_os_disk" {
  description = "List of storage_os_disk values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.storage_os_disk]
}
output "virtual_machines_tags" {
  description = "List of tags values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.tags]
}
output "virtual_machines_vm_size" {
  description = "List of vm_size values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.vm_size]
}
output "virtual_machines_zones" {
  description = "List of zones values across all virtual_machines"
  value       = [for k, v in azurerm_virtual_machine.virtual_machines : v.zones]
}

