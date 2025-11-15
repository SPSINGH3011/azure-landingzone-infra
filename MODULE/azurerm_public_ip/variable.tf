variable "pips" {
  type = map(object({
    public_ip_name      = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}
