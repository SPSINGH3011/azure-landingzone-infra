output "rg-id" {
  # value = { for rg , u in azurerm_resource_group.rg : rg => u.id }
  value = module.resource_groups
}

output "vnet_id" {
  value = module.virtual_network
}

output "subnet_id" {
  value = module.virtual_network.subnet_id
}

output "pip_id" {
  value = module.pip
}

output "nic_id" {
  value = module.nic
}

output "nsg" {
  value = module.nsg
}

output "kv" {
  value = module.kv
}

output "secret" {
  value = module.secret
}

output "virtual_linux_machine" {
  value = module.secret
}

