terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  # backend "azurerm" {
  #   container_name = "terraformstate"
  #   key = "arpit.terraform.tfstate"
  #   resource_group_name = "ArpitRG"
  #   storage_account_name = "arpit20230822"
    
  # }
}

provider "azurerm" {
  features {
    
  }
}