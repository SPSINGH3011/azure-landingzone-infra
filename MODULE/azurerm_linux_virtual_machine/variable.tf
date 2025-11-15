variable "linux_virtual_machine" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    # admin_username                  = string
    # admin_password                  = string
    disable_password_authentication = bool

    keyvault_name   = string
    nic-name        = string
    secret_name     = string
    secret_password = string
    # custom_data  = string
    script_name = string

    os_disks = list(object({
      caching              = string
      storage_account_type = string
    }))

    source_image_references = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}






