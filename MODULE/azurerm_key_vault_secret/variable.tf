# variable "secret" {
#   type = map(object({
#     secret-name         = string
#     secret-value        = string
#     keyvault_name       = string
#     resource_group_name = string
#   }))
# }

variable "secret" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    keyvault_name       = string
    resource_group_name = string
    # keyvault_id =    map(string)
  }))
}