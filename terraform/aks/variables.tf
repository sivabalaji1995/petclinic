variable "vault_addr" {
  default = "http://127.0.0.1:8200"
}


# variable "client_id" {
#   description = "The Client ID for the Azure AD application"
#   type        = string
# }

# variable "client_secret" {
#   description = "The Client Secret for the Azure AD application"
#   type        = string
# }

# variable "tenant_id" {
#   description = "The Tenant ID for the Azure AD application"
#   type        = string
# }

# variable "subscription_id" {
#   description = "The Subscription ID for the Azure subscription"
#   type        = string
# }
## ==========================================
variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "East US" # Change to your preferred Azure region
}

## TAGS
variable "environment" {
  description = "The environment tag for the resource group"
  type        = string
  default     = "Terraform" 
  
}

variable "created_by" {
  description = "The creator of the resource group"
  type        = string
  default     = "Terraform" 
  
}