# Terraform Configuration File to create a Resource Group

terraform {
  required_version = ">= 1.2.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

/*
  Description: Create a Resource Group
*/
resource "azurerm_resource_group" "rg-womd-test-001" {
  name     = "rg-womd-test-001" // Azure Resource Group Name
  location = "eastus"           // Azure Region
}
