module "resource_groups" {
  source = "../../MODULE/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_groups]
  source     = "../../MODULE/azurerm_virtual_network"
  vnets      = var.vnets
}

module "pip" {
  depends_on = [module.resource_groups]
  source     = "../../MODULE/azurerm_public_ip"
  pips       = var.pips
}

module "nic" {
  depends_on = [module.virtual_network, module.resource_groups]
  source     = "../../MODULE/azurerm_network_interface"
  nic        = var.nic
}

module "nsg" {
  depends_on = [module.resource_groups, module.nic, module.virtual_network]
  source     = "../../MODULE/azurerm_network_security_group"
  nsg        = var.nsg
}


module "kv" {
  depends_on = [module.resource_groups]
  source     = "../../MODULE/azurerm_key_vault"
  kv         = var.kv
}

module "secret" {
  depends_on = [module.kv]
  source     = "../../MODULE/azurerm_key_vault_secret"
  secret     = var.secret
  # keyvault_ids  = module.keyvault.keyvault_ids
}

module "virtual_linux_machine" {
  depends_on            = [module.kv, module.secret, module.resource_groups, module.virtual_network, module.nic, module.nsg, module.nsg]
  source                = "../../MODULE/azurerm_linux_virtual_machine"
  linux_virtual_machine = var.linux_virtual_machine
}




