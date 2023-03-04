terraform {
  backend "azurerm" {
    resource_group_name  = "terratest-rg"
    storage_account_name = "terrargtest"
    container_name       = "terracontainer"
    key                  = "terraform.tfstate"
  }
}