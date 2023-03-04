terraform {
  backend "azurerm" {
    resource_group_name  = "Terra-rg-test"
    storage_account_name = "terrastorage22"
    container_name       = "terra2356"
    key                  = "terraform.tfstate"
  }
}