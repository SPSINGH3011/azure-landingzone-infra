terraform {
  backend "azurerm" {
    resource_group_name  = "statefile-rg"
    storage_account_name = "value"
    container_name       = "value"
    key                  = dev.terraform.tfstate
  }
}
