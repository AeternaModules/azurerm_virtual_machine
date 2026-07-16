output "virtual_machines_id" {
  description = "Map of id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_machines_additional_capabilities" {
  description = "Map of additional_capabilities values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.additional_capabilities if v.additional_capabilities != null && length(v.additional_capabilities) > 0 }
}
output "virtual_machines_availability_set_id" {
  description = "Map of availability_set_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.availability_set_id if v.availability_set_id != null && length(v.availability_set_id) > 0 }
}
output "virtual_machines_boot_diagnostics" {
  description = "Map of boot_diagnostics values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.boot_diagnostics if v.boot_diagnostics != null && length(v.boot_diagnostics) > 0 }
}
output "virtual_machines_delete_data_disks_on_termination" {
  description = "Map of delete_data_disks_on_termination values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.delete_data_disks_on_termination if v.delete_data_disks_on_termination != null }
}
output "virtual_machines_delete_os_disk_on_termination" {
  description = "Map of delete_os_disk_on_termination values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.delete_os_disk_on_termination if v.delete_os_disk_on_termination != null }
}
output "virtual_machines_identity" {
  description = "Map of identity values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "virtual_machines_license_type" {
  description = "Map of license_type values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.license_type if v.license_type != null && length(v.license_type) > 0 }
}
output "virtual_machines_location" {
  description = "Map of location values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.location if v.location != null && length(v.location) > 0 }
}
output "virtual_machines_name" {
  description = "Map of name values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_machines_network_interface_ids" {
  description = "Map of network_interface_ids values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.network_interface_ids if v.network_interface_ids != null && length(v.network_interface_ids) > 0 }
}
output "virtual_machines_os_profile" {
  description = "Map of os_profile values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile if v.os_profile != null && length(v.os_profile) > 0 }
  sensitive   = true
}
output "virtual_machines_os_profile_linux_config" {
  description = "Map of os_profile_linux_config values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_linux_config if v.os_profile_linux_config != null && length(v.os_profile_linux_config) > 0 }
}
output "virtual_machines_os_profile_secrets" {
  description = "Map of os_profile_secrets values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_secrets if v.os_profile_secrets != null && length(v.os_profile_secrets) > 0 }
}
output "virtual_machines_os_profile_windows_config" {
  description = "Map of os_profile_windows_config values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.os_profile_windows_config if v.os_profile_windows_config != null && length(v.os_profile_windows_config) > 0 }
  sensitive   = true
}
output "virtual_machines_plan" {
  description = "Map of plan values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.plan if v.plan != null && length(v.plan) > 0 }
}
output "virtual_machines_primary_network_interface_id" {
  description = "Map of primary_network_interface_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.primary_network_interface_id if v.primary_network_interface_id != null && length(v.primary_network_interface_id) > 0 }
}
output "virtual_machines_proximity_placement_group_id" {
  description = "Map of proximity_placement_group_id values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.proximity_placement_group_id if v.proximity_placement_group_id != null && length(v.proximity_placement_group_id) > 0 }
}
output "virtual_machines_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "virtual_machines_storage_data_disk" {
  description = "Map of storage_data_disk values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_data_disk if v.storage_data_disk != null && length(v.storage_data_disk) > 0 }
}
output "virtual_machines_storage_image_reference" {
  description = "Map of storage_image_reference values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_image_reference if v.storage_image_reference != null && length(v.storage_image_reference) > 0 }
}
output "virtual_machines_storage_os_disk" {
  description = "Map of storage_os_disk values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.storage_os_disk if v.storage_os_disk != null && length(v.storage_os_disk) > 0 }
}
output "virtual_machines_tags" {
  description = "Map of tags values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "virtual_machines_vm_size" {
  description = "Map of vm_size values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.vm_size if v.vm_size != null && length(v.vm_size) > 0 }
}
output "virtual_machines_zones" {
  description = "Map of zones values across all virtual_machines, keyed the same as var.virtual_machines"
  value       = { for k, v in azurerm_virtual_machine.virtual_machines : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

