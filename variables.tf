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
    delete_data_disks_on_termination = optional(bool)
    delete_os_disk_on_termination    = optional(bool)
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
      write_accelerator_enabled = optional(bool)
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
      ssh_keys = optional(list(object({
        key_data = string
        path     = string
      })))
    }))
    os_profile_secrets = optional(list(object({
      source_vault_id = string
      vault_certificates = optional(list(object({
        certificate_store = optional(string)
        certificate_url   = string
      })))
    })))
    os_profile_windows_config = optional(object({
      additional_unattend_config = optional(list(object({
        component    = string
        content      = string
        pass         = string
        setting_name = string
      })))
      enable_automatic_upgrades = optional(bool)
      provision_vm_agent        = optional(bool)
      timezone                  = optional(string)
      winrm = optional(list(object({
        certificate_url = optional(string)
        protocol        = string
      })))
    }))
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
    }))
    storage_data_disk = optional(list(object({
      caching                   = optional(string)
      create_option             = string
      disk_size_gb              = optional(number)
      lun                       = number
      managed_disk_id           = optional(string)
      managed_disk_type         = optional(string)
      name                      = string
      vhd_uri                   = optional(string)
      write_accelerator_enabled = optional(bool)
    })))
    storage_image_reference = optional(object({
      id        = optional(string)
      offer     = optional(string)
      publisher = optional(string)
      sku       = optional(string)
      version   = optional(string)
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_machine's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: license_type
  #   condition: contains(["Windows_Client", "Windows_Server"], value)
  #   message:   must be one of: Windows_Client, Windows_Server
  # path: storage_os_disk.os_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_os_disk.managed_disk_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_os_disk.disk_size_gb
  #   source:    [from validate.DiskSizeGB] value < 0 || value > 32767
  # path: storage_data_disk.managed_disk_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_data_disk.disk_size_gb
  #   source:    [from validate.DiskSizeGB] value < 0 || value > 32767
  # path: os_profile_windows_config.timezone
  #   source:    validate.VirtualMachineTimeZoneCaseInsensitive: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: os_profile_windows_config.winrm.protocol
  #   condition: contains(["HTTP", "HTTPS"], value)
  #   message:   must be one of: HTTP, HTTPS
  # path: os_profile_windows_config.additional_unattend_config.pass
  #   condition: contains(["oobeSystem"], value)
  #   message:   must be one of: oobeSystem
  # path: os_profile_windows_config.additional_unattend_config.component
  #   condition: contains(["Microsoft-Windows-Shell-Setup"], value)
  #   message:   must be one of: Microsoft-Windows-Shell-Setup
  # path: os_profile_windows_config.additional_unattend_config.setting_name
  #   condition: contains(["AutoLogon", "FirstLogonCommands"], value)
  #   message:   must be one of: AutoLogon, FirstLogonCommands
  # path: network_interface_ids[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

