variable "vnets" {
  type = map(object({
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    address_space        = list(string)
    subnets = optional(map(object({
      name = string
      #   address_prefixes = string
      # })))
      address_prefixes = list(string)
    })), {})
  }))
}


#,{} null value

# map {}
# list []



