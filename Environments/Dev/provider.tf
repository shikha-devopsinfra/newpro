terraform {
  backend "azurerm" {
    resource_group_name  = "imax-rg"
    storage_account_name = "imaxstgs"
    container_name       = "imaxcontainerss"
    key                  = "Development/Development.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.32.0"
    }

   
  }
}
provider "azurerm" {
  features {}
  subscription_id = "2af63522-f4cf-47c6-a535-08dbd21adcad"
}