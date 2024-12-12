terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.3.0"
    }
  }

  # backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.account_info.subscription_id

  features {
    
  }
}
