variable "resource_group_name" {
  type    = string
  default = "dev-environment-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "app_service_plan_sku" {
  type    = string
  default = "Standard_S1"
}

# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "simple-service-plan"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = var.app_service_plan_sku
  }
  tags = {
    environment = "dev"
  }
}

# Create JAVA app service
resource "azurerm_app_service" "app-service" {
  name                = "my-awesome-app-svc"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  site_config {
    linux_fx_version = "TOMCAT|8.5-java11"
  }

  tags = {
    environment = "dev"
  }
}
