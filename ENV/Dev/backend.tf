terraform {
  backend "azurerm" {
    resource_group_name  = "statefile-rg"
    storage_account_name = "statetorage"
    container_name       = "statecon"
    key                  = dev.terraform.tfstate
  }
}
