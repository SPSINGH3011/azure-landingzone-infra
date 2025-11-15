# data "azurerm_client_config" "current" {}


# resource "azurerm_key_vault" "kv" {
#   for_each                    = var.kv
#   name                        = each.value.keyvault_name
#   location                    = each.value.location
#   resource_group_name         = each.value.resource_group_name
#   enabled_for_disk_encryption = each.value.enabled_for_disk_encryption #true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = each.value.soft_delete_retention_days #7
#   purge_protection_enabled    = each.value.purge_protection_enabled   #false

#   sku_name = "standard"
#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#       "List",
#     ]
#     secret_permissions = [
#       "Get",
#       "List",
#       "Set",
#       "Purge",
#       "Backup",
#       "Delete",
#       "Restore",
#       "Restore"
#     ]
#     storage_permissions = [
#       "Get",
#       "Set",
#       "List"
#     ]
#   }
# }


data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  for_each                    = var.kv
  name                        = each.value.keyvault_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Get", "List"]
    secret_permissions = ["Get", "List", "Set", "Purge", "Backup", "Delete", "Restore"]
    storage_permissions = ["Get", "Set", "List"]
  }
}

