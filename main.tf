# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = "miketerra-environment-rg"
  location = "east US"
}

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name = "mikeTerra-service-plan45"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = {
    environment = "dev"
  }
}

# Create JAVA app service
resource "azurerm_app_service" "app-service" {
  name = "miketerra-awesome-app-java"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

site_config {
    linux_fx_version = "TOMCAT|8.5-java11"
  }
tags = {
    environment = "dev"
  }
}
