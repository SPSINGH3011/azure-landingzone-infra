output "nsg"{
    value = {for nsg, nsecurity in azurerm_network_security_group.nsg : nsg => nsecurity.id }
}