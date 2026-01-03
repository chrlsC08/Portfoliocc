terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "vaultcc7888"
    container_name       = "tfstate"
    key                  = "online-frontend.tfstate" 
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"

    }
  }
}
