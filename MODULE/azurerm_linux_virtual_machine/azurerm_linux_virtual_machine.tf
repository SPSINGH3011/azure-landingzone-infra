resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.linux_virtual_machine
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username[each.key].name
  admin_password                  = data.azurerm_key_vault_secret.password[each.key].value
  disable_password_authentication = each.value.disable_password_authentication
  custom_data                     = base64encode(file(each.value.script_name))
  # custom_data                     = base64encode("sudo apt update sudo apt insall nginx -y") #each.value.custom_data
  #  keyvault_name   = data.azurerm_key_vault.kv[each.key].name
  # nic-name        = data.azurerm_network_interface.nic[each.key].name
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,
  ]

  # OS Disk
  dynamic "os_disk" {
    for_each = each.value.os_disks
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }

  # Source Image
  dynamic "source_image_reference" {
    for_each = each.value.source_image_references
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
}


