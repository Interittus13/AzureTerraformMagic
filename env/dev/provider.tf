terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "resourse group"
    storage_account_name = "storage account"
    container_name       = "conatiiner"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}
