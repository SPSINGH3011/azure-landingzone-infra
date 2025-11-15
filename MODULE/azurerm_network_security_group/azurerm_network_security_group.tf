resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}


resource "azurerm_subnet_network_security_group_association" "nsa" {
  for_each                  = var.nsg
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_network_interface_security_group_association" "nica" {
  for_each                  = var.nsg
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}





# data "azurerm_network_security_group" "nsg" {
#   name                = "example"
#   resource_group_name = azurerm_resource_group.example.name
# }
