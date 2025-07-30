terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Último teste para acionar o App do Infracost
resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
} 

# Disparando a análise final do Infracost