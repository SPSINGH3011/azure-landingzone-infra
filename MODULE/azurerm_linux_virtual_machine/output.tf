output "vm" {
  value = { for vm, vms in azurerm_linux_virtual_machine.vm : vm => vms.id }
}
