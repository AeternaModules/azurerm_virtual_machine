resource "azurerm_virtual_machine" "virtual_machines" {
  for_each = var.virtual_machines

  location                         = each.value.location
  name                             = each.value.name
  network_interface_ids            = each.value.network_interface_ids
  resource_group_name              = each.value.resource_group_name
  vm_size                          = each.value.vm_size
  availability_set_id              = each.value.availability_set_id
  delete_data_disks_on_termination = each.value.delete_data_disks_on_termination
  delete_os_disk_on_termination    = each.value.delete_os_disk_on_termination
  license_type                     = each.value.license_type
  primary_network_interface_id     = each.value.primary_network_interface_id
  proximity_placement_group_id     = each.value.proximity_placement_group_id
  tags                             = each.value.tags
  zones                            = each.value.zones

  storage_os_disk {
    caching                   = each.value.storage_os_disk.caching
    create_option             = each.value.storage_os_disk.create_option
    disk_size_gb              = each.value.storage_os_disk.disk_size_gb
    image_uri                 = each.value.storage_os_disk.image_uri
    managed_disk_id           = each.value.storage_os_disk.managed_disk_id
    managed_disk_type         = each.value.storage_os_disk.managed_disk_type
    name                      = each.value.storage_os_disk.name
    os_type                   = each.value.storage_os_disk.os_type
    vhd_uri                   = each.value.storage_os_disk.vhd_uri
    write_accelerator_enabled = each.value.storage_os_disk.write_accelerator_enabled
  }

  dynamic "additional_capabilities" {
    for_each = each.value.additional_capabilities != null ? [each.value.additional_capabilities] : []
    content {
      ultra_ssd_enabled = additional_capabilities.value.ultra_ssd_enabled
    }
  }

  dynamic "boot_diagnostics" {
    for_each = each.value.boot_diagnostics != null ? [each.value.boot_diagnostics] : []
    content {
      enabled     = boot_diagnostics.value.enabled
      storage_uri = boot_diagnostics.value.storage_uri
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "os_profile" {
    for_each = each.value.os_profile != null ? [each.value.os_profile] : []
    content {
      admin_password = os_profile.value.admin_password
      admin_username = os_profile.value.admin_username
      computer_name  = os_profile.value.computer_name
      custom_data    = os_profile.value.custom_data
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = each.value.os_profile_linux_config != null ? [each.value.os_profile_linux_config] : []
    content {
      disable_password_authentication = os_profile_linux_config.value.disable_password_authentication
      dynamic "ssh_keys" {
        for_each = os_profile_linux_config.value.ssh_keys != null ? [os_profile_linux_config.value.ssh_keys] : []
        content {
          key_data = ssh_keys.value.key_data
          path     = ssh_keys.value.path
        }
      }
    }
  }

  dynamic "os_profile_secrets" {
    for_each = each.value.os_profile_secrets != null ? [each.value.os_profile_secrets] : []
    content {
      source_vault_id = os_profile_secrets.value.source_vault_id
      dynamic "vault_certificates" {
        for_each = os_profile_secrets.value.vault_certificates != null ? [os_profile_secrets.value.vault_certificates] : []
        content {
          certificate_store = vault_certificates.value.certificate_store
          certificate_url   = vault_certificates.value.certificate_url
        }
      }
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = each.value.os_profile_windows_config != null ? [each.value.os_profile_windows_config] : []
    content {
      dynamic "additional_unattend_config" {
        for_each = os_profile_windows_config.value.additional_unattend_config != null ? [os_profile_windows_config.value.additional_unattend_config] : []
        content {
          component    = additional_unattend_config.value.component
          content      = additional_unattend_config.value.content
          pass         = additional_unattend_config.value.pass
          setting_name = additional_unattend_config.value.setting_name
        }
      }
      enable_automatic_upgrades = os_profile_windows_config.value.enable_automatic_upgrades
      provision_vm_agent        = os_profile_windows_config.value.provision_vm_agent
      timezone                  = os_profile_windows_config.value.timezone
      dynamic "winrm" {
        for_each = os_profile_windows_config.value.winrm != null ? [os_profile_windows_config.value.winrm] : []
        content {
          certificate_url = winrm.value.certificate_url
          protocol        = winrm.value.protocol
        }
      }
    }
  }

  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "storage_data_disk" {
    for_each = each.value.storage_data_disk != null ? [each.value.storage_data_disk] : []
    content {
      caching                   = storage_data_disk.value.caching
      create_option             = storage_data_disk.value.create_option
      disk_size_gb              = storage_data_disk.value.disk_size_gb
      lun                       = storage_data_disk.value.lun
      managed_disk_id           = storage_data_disk.value.managed_disk_id
      managed_disk_type         = storage_data_disk.value.managed_disk_type
      name                      = storage_data_disk.value.name
      vhd_uri                   = storage_data_disk.value.vhd_uri
      write_accelerator_enabled = storage_data_disk.value.write_accelerator_enabled
    }
  }

  dynamic "storage_image_reference" {
    for_each = each.value.storage_image_reference != null ? [each.value.storage_image_reference] : []
    content {
      id        = storage_image_reference.value.id
      offer     = storage_image_reference.value.offer
      publisher = storage_image_reference.value.publisher
      sku       = storage_image_reference.value.sku
      version   = storage_image_reference.value.version
    }
  }
}

