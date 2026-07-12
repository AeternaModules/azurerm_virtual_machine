output "virtual_machines_id" {
  description = "Map of id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.id }
}
output "virtual_machines_additional_capabilities" {
  description = "Map of additional_capabilities values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.additional_capabilities }
}
output "virtual_machines_availability_set_id" {
  description = "Map of availability_set_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.availability_set_id }
}
output "virtual_machines_boot_diagnostics" {
  description = "Map of boot_diagnostics values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.boot_diagnostics }
}
output "virtual_machines_delete_data_disks_on_termination" {
  description = "Map of delete_data_disks_on_termination values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.delete_data_disks_on_termination }
}
output "virtual_machines_delete_os_disk_on_termination" {
  description = "Map of delete_os_disk_on_termination values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.delete_os_disk_on_termination }
}
output "virtual_machines_identity" {
  description = "Map of identity values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.identity }
}
output "virtual_machines_license_type" {
  description = "Map of license_type values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.license_type }
}
output "virtual_machines_location" {
  description = "Map of location values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.location }
}
output "virtual_machines_name" {
  description = "Map of name values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.name }
}
output "virtual_machines_network_interface_ids" {
  description = "Map of network_interface_ids values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.network_interface_ids }
}
output "virtual_machines_os_profile" {
  description = "Map of os_profile values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile }
  sensitive   = true
}
output "virtual_machines_os_profile_linux_config" {
  description = "Map of os_profile_linux_config values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_linux_config }
}
output "virtual_machines_os_profile_secrets" {
  description = "Map of os_profile_secrets values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_secrets }
}
output "virtual_machines_os_profile_windows_config" {
  description = "Map of os_profile_windows_config values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_windows_config }
  sensitive   = true
}
output "virtual_machines_plan" {
  description = "Map of plan values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.plan }
}
output "virtual_machines_primary_network_interface_id" {
  description = "Map of primary_network_interface_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.primary_network_interface_id }
}
output "virtual_machines_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.proximity_placement_group_id }
}
output "virtual_machines_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.resource_group_name }
}
output "virtual_machines_storage_data_disk" {
  description = "Map of storage_data_disk values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_data_disk }
}
output "virtual_machines_storage_image_reference" {
  description = "Map of storage_image_reference values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_image_reference }
}
output "virtual_machines_storage_os_disk" {
  description = "Map of storage_os_disk values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_os_disk }
}
output "virtual_machines_tags" {
  description = "Map of tags values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.tags }
}
output "virtual_machines_vm_size" {
  description = "Map of vm_size values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.vm_size }
}
output "virtual_machines_zones" {
  description = "Map of zones values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.zones }
}

