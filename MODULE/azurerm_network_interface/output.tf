output "nic_id" {
value = {for nics , nic in azurerm_network_interface.nic : nics =>nic.id}
}
