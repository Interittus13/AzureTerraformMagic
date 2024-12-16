terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.14.0"
    }
  }

  # backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = module.locals.account_info.subscription_id

  features {
    
  }
}
