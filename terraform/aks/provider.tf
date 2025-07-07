terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 3.0"
      }
    }

    backend "azurerm" {
      resource_group_name  = "terraform"
      storage_account_name = "terrabackend2025"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
      
    }
}

provider "azurerm" {
  features {}
  client_id = var.client_id
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  client_secret = var.client_secret
}
