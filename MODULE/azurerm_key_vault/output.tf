# output "kv" {
#   value = { for kv, keyvault in azurerm_key_vault.kv : kv => keyvault.id }
# }


output "keyvault_ids" {
  value = {
    for k, v in azurerm_key_vault.kv : k => v.id
  }
}