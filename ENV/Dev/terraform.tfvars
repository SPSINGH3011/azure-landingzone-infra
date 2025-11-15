rgs = {
  "rg1" = {
    name       = "dev-rg1-25"
    location   = "West Europe"
    managed_by = "team-a"
    tags = {
      environment = "development"
      project     = "project-x"
    }
  }

  "rg2" = {
    name     = "dev-rg2-25"
    location = "Central india"
  }

  "rg3" = {
    name     = "dev-rg3-25"
    location = "central us"
    tags = {
      environment = "development"
      project     = "project-y"
    }
  }
}

#azurerm_resource_group.rg.rg1
#azurerm_resource_group.rg.rg2
#azurerm_resource_group.rg.rg3

vnets = {
  vnet1 = {
    virtual_network_name = "dev-fevnet1-25"
    location             = "West Europe"
    resource_group_name  = "dev-rg1-25"
    address_space        = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "dev-fesubnet1-25"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }

  vnet2 = {
    virtual_network_name = "dev-fevnet2-25"
    location             = "Central india"
    resource_group_name  = "dev-rg2-25"
    address_space        = ["10.0.0.0/16"]
    subnets = {
      subnet2 = {
        name             = "dev-fesubnet2-25"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pips = {
  pip1 = {
    public_ip_name      = "dev-pip1-25"
    resource_group_name = "dev-rg1-25"
    location            = "West Europe"
    allocation_method   = "Static"
  }

  pip2 = {
    public_ip_name      = "dev-pip2-25"
    resource_group_name = "dev-rg2-25"
    location            = "Central india"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    nic_name             = "dev-nic1-25"
    location             = "West Europe"
    resource_group_name  = "dev-rg1-25"
    virtual_network_name = "dev-fevnet1-25"
    subnet_name          = "dev-fesubnet1-25"
    ip_configuration = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
  } }

  nic2 = {
    nic_name             = "dev-nic2-25"
    location             = "Central india"
    resource_group_name  = "dev-rg2-25"
    virtual_network_name = "dev-fevnet2-25"
    subnet_name          = "dev-fesubnet2-25"
    ip_configuration = {
      ip2 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
  } }
}

nsg = {
  nsg1 = {
    nsg_name             = "dev-nsg1-25"
    location             = "West Europe"
    resource_group_name  = "dev-rg1-25"
    nic_name             = "dev-nic1-25"
    virtual_network_name = "dev-fevnet1-25"
    subnet_name          = "dev-fesubnet1-25"

    security_rules = {
      secure1 = {
        name                       = "dev-secure1-25"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }

  nsg2 = {
    nsg_name             = "dev-nsg2-25"
    location             = "Central india"
    resource_group_name  = "dev-rg2-25"
    nic_name             = "dev-nic2-25"
    virtual_network_name = "dev-fevnet2-25"
    subnet_name          = "dev-fesubnet2-25"

    security_rules = {
      secure2 = {
        name                       = "dev-secure2-25"
        priority                   = 300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

kv = {
  kv1 = {
    keyvault_name               = "dev-keyvault1-25"
    location                    = "West Europe"
    resource_group_name         = "dev-rg1-25"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }

  kv2 = {
    keyvault_name               = "dev-keyvault2-25"
    location                    = "Central india"
    resource_group_name         = "dev-rg2-25"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }
}

secret = {
  secret_kv1_user = {
    secret_name         = "dev-feusername-01"
    secret_value        = "satya"
    keyvault_name       = "dev-keyvault1-25"
    resource_group_name = "dev-rg1-25"
  }
  secret_kv1_pass = {
    secret_name         = "dev-fepass-01"
    secret_value        = "satya@$%64755"
    keyvault_name       = "dev-keyvault1-25"
    resource_group_name = "dev-rg1-25"
  }
  secret_kv2_user = {
    secret_name         = "dev-feusername-02"
    secret_value        = "satya"
    keyvault_name       = "dev-keyvault2-25"
    resource_group_name = "dev-rg2-25"
  }
  secret_kv2_pass = {
    secret_name         = "dev-fepass-02"
    secret_value        = "satya@$%64755"
    keyvault_name       = "dev-keyvault2-25"
    resource_group_name = "dev-rg2-25"
  }
}

linux_virtual_machine = {
  linux-vm1 = {
    vm_name                         = "dev-fevm-01"
    resource_group_name             = "dev-rg1-25"
    location                        = "West Europe"
    size                            = "Standard_F2"
    disable_password_authentication = false
    secret_name                     = "dev-feusername-01"
    secret_password                 = "dev-fepass-01"
    nic-name                        = "dev-nic1-25"
    keyvault_name                   = "dev-keyvault1-25"
    # custom_data                     = "c3VkbyBhcHQgdXBkYXRlCnN1ZG8gYXB0IGluc3RhbGwgbmdpbnggLXk="
    script_name = "nginx.sh"
    os_disks = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_references = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
      }
    ]
  }


  linux-vm2 = {
    vm_name                         = "dev-fevm-02"
    resource_group_name             = "dev-rg2-25"
    location                        = "Central india"
    size                            = "Standard_F2s_v2"
    disable_password_authentication = false
    keyvault_name                   = "dev-keyvault2-25"
    secret_name                     = "dev-feusername-02"
    secret_password                 = "dev-fepass-02"
    nic-name                        = "dev-nic2-25"
    keyvault_name                   = "dev-keyvault2-25"
    # custom_data                     = "c3VkbyBhcHQgdXBkYXRlCnN1ZG8gYXB0IGluc3RhbGwgbmdpbnggLXk="
    script_name = "nginx.sh"
    os_disks = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_references = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
      }
    ]
  }

}

