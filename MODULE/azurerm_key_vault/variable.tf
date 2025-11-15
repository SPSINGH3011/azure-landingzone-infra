variable "kv" {
  type = map(object({
    keyvault_name               = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool   #true
    soft_delete_retention_days  = number #7
    purge_protection_enabled    = bool
  }))
}

