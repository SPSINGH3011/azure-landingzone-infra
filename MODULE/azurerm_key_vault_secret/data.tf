
data "azurerm_key_vault" "secret" {
  for_each            = var.secret
  name                = each.value.keyvault_name
  resource_group_name = each.value.resource_group_name
}
