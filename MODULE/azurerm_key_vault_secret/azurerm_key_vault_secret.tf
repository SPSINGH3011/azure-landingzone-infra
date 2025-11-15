# resource "azurerm_key_vault_secret" "secret" {
#   for_each   = var.secret
#   name       = each.value.secret-name
#   value      = each.value.secret-value
#   #   key_vault_id = data.azurerm_key_vault.secret[each.key].id
#   key_vault_id = azurerm_key_vault.kv[each.value.keyvault_name].id

# }

resource "azurerm_key_vault_secret" "secret" {
  for_each = var.secret

  name  = each.value.secret_name
  value = each.value.secret_value
  #   key_vault_id = data.azurerm_key_vault.secret[each.value.keyvault_name]
  key_vault_id = data.azurerm_key_vault.secret[each.key].id

  depends_on = [
    null_resource.purge_deleted_secrets
  ]
}
