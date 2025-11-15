output "vnet_id" {
    value = {for vnet , v in azurerm_virtual_network.vnet : vnet => v.id}
}


output "subnet_id" {
value = {for subnet , s in azurerm_virtual_network.vnet : subnet =>s.id}
}

