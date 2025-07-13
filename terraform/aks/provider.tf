terraform {
  required_providers {

    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
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

# provider "vault" {
#   address = "http://localhost:8200"
# }

data "vault_kv_secret_v2" "azure" {
  mount = "secret"
  name  = "azure"
}
# Provider configuration for Azure
# This provider block is used to authenticate with Azure using the provided credentials.
provider "azurerm" {
  features {}
  # client_id       = data.vault_kv_secret_v2.azure.data["client_id"]
  # tenant_id       = data.vault_kv_secret_v2.azure.data["tenant_id"]
  # subscription_id = data.vault_kv_secret_v2.azure.data["subscription_id"]
  # # The client_secret is not set here as it is sensitive and should be handled securely.
  # client_secret = data.vault_kv_secret_v2.azure.data["client_secret"]
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  # The client_secret is not set here as it is sensitive and should be handled securely.
  client_secret = var.client_secret
}

provider "azuread" {
  # # client_id       = data.vault_kv_secret_v2.azure.data["client_id"]
  tenant_id       = var.tenant_id
  # # subscription_id = data.vault_kv_secret_v2.azure.data["subscription_id"]
  # # # The client_secret is not set here as it is sensitive and should be handled securely.
  # # client_secret = data.vault_kv_secret_v2.azure.data["client_secret"]
}
