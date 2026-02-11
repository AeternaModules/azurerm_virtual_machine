variable "virtual_machines" {
  description = <<EOT
Map of virtual_machines, attributes below
Required:
    - location
    - name
    - network_interface_ids
    - resource_group_name
    - vm_size
    - storage_os_disk (block):
        - caching (optional)
        - create_option (required)
        - disk_size_gb (optional)
        - image_uri (optional)
        - managed_disk_id (optional)
        - managed_disk_type (optional)
        - name (required)
        - os_type (optional)
        - vhd_uri (optional)
        - write_accelerator_enabled (optional)
Optional:
    - availability_set_id
    - delete_data_disks_on_termination
    - delete_os_disk_on_termination
    - license_type
    - primary_network_interface_id
    - proximity_placement_group_id
    - tags
    - zones
    - additional_capabilities (block):
        - ultra_ssd_enabled (required)
    - boot_diagnostics (block):
        - enabled (required)
        - storage_uri (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - os_profile (block):
        - admin_password (optional)
        - admin_username (required)
        - computer_name (required)
        - custom_data (optional)
    - os_profile_linux_config (block):
        - disable_password_authentication (required)
        - ssh_keys (optional, block):
            - key_data (required)
            - path (required)
    - os_profile_secrets (block):
        - source_vault_id (required)
        - vault_certificates (optional, block):
            - certificate_store (optional)
            - certificate_url (required)
    - os_profile_windows_config (block):
        - additional_unattend_config (optional, block):
            - component (required)
            - content (required)
            - pass (required)
            - setting_name (required)
        - enable_automatic_upgrades (optional)
        - provision_vm_agent (optional)
        - timezone (optional)
        - winrm (optional, block):
            - certificate_url (optional)
            - protocol (required)
    - plan (block):
        - name (required)
        - product (required)
        - publisher (required)
    - storage_data_disk (block):
        - caching (optional)
        - create_option (required)
        - disk_size_gb (optional)
        - lun (required)
        - managed_disk_id (optional)
        - managed_disk_type (optional)
        - name (required)
        - vhd_uri (optional)
        - write_accelerator_enabled (optional)
    - storage_image_reference (block):
        - id (optional)
        - offer (optional)
        - publisher (optional)
        - sku (optional)
        - version (optional)
EOT

  type = map(object({
    location                         = string
    name                             = string
    network_interface_ids            = list(string)
    resource_group_name              = string
    vm_size                          = string
    availability_set_id              = optional(string)
    delete_data_disks_on_termination = optional(bool) # Default: false
    delete_os_disk_on_termination    = optional(bool) # Default: false
    license_type                     = optional(string)
    primary_network_interface_id     = optional(string)
    proximity_placement_group_id     = optional(string)
    tags                             = optional(map(string))
    zones                            = optional(list(string))
    storage_os_disk = object({
      caching                   = optional(string)
      create_option             = string
      disk_size_gb              = optional(number)
      image_uri                 = optional(string)
      managed_disk_id           = optional(string)
      managed_disk_type         = optional(string)
      name                      = string
      os_type                   = optional(string)
      vhd_uri                   = optional(string)
      write_accelerator_enabled = optional(bool) # Default: false
    })
    additional_capabilities = optional(object({
      ultra_ssd_enabled = bool
    }))
    boot_diagnostics = optional(object({
      enabled     = bool
      storage_uri = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    os_profile = optional(object({
      admin_password = optional(string)
      admin_username = string
      computer_name  = string
      custom_data    = optional(string)
    }))
    os_profile_linux_config = optional(object({
      disable_password_authentication = bool
      ssh_keys = optional(object({
        key_data = string
        path     = string
      }))
    }))
    os_profile_secrets = optional(object({
      source_vault_id = string
      vault_certificates = optional(object({
        certificate_store = optional(string)
        certificate_url   = string
      }))
    }))
    os_profile_windows_config = optional(object({
      additional_unattend_config = optional(object({
        component    = string
        content      = string
        pass         = string
        setting_name = string
      }))
      enable_automatic_upgrades = optional(bool) # Default: false
      provision_vm_agent        = optional(bool) # Default: false
      timezone                  = optional(string)
      winrm = optional(object({
        certificate_url = optional(string)
        protocol        = string
      }))
    }))
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))
    storage_data_disk = optional(object({
      caching                   = optional(string)
      create_option             = string
      disk_size_gb              = optional(number)
      lun                       = number
      managed_disk_id           = optional(string)
      managed_disk_type         = optional(string)
      name                      = string
      vhd_uri                   = optional(string)
      write_accelerator_enabled = optional(bool) # Default: false
    }))
    storage_image_reference = optional(object({
      id        = optional(string)
      offer     = optional(string)
      publisher = optional(string)
      sku       = optional(string)
      version   = optional(string)
    }))
  }))
}

