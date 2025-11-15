data "azurerm_network_interface" "nic" {
  for_each            = var.linux_virtual_machine
  name                = each.value.nic-name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.linux_virtual_machine
  name                = each.value.keyvault_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault_secret" "username" {
  for_each     = var.linux_virtual_machine
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.linux_virtual_machine
  name         = each.value.secret_password
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

