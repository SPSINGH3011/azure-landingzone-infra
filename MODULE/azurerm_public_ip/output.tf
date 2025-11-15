output "pip_id" {
value = {for public , pip in azurerm_public_ip.pip : public =>pip.id}
}
