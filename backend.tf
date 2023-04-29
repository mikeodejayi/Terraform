terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-RG"
    storage_account_name = "terraformstorage27"
    container_name       = "terraform-tfstate"
    key                  = "terraform.tfstate"
  }
}