variable "nic" {
  type = map(object({
    nic_name                = string
    location            = string
    resource_group_name = string
    virtual_network_name = string
    subnet_name = string

    # ip_configuration = list(string({
    #   name                          = string
    #   private_ip_address_allocation = string
    # }))

    ip_configuration = map(object({
          name                          = string
      private_ip_address_allocation = string
    }))     
    
  }))
    }


