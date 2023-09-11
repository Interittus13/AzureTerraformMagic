terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  # backend "azurerm" {
  #   container_name = "mycontainer"
  #   key = "arpit.terraform.tfstate"
  #   resource_group_name = "ArpitRG-2208" # created in Part 1
  #   storage_account_name = "mystorageaccountarpit"
    
  # }
}

provider "azurerm" {
  features {
    
  }
}