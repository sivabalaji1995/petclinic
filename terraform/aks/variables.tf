variable "vault_addr" {
  default = "http://127.0.0.1:8200"
}

variable "client_id" {
  description = "The client ID for Azure authentication"
  type        = string  
  
}
variable "tenant_id" {
  description = "The tenant ID for Azure authentication"
  type        = string
}
variable "subscription_id" {
  description = "The subscription ID for Azure authentication"
  type        = string
}
variable "client_secret" {
  description = "The client secret for Azure authentication"
  type        = string
  sensitive   = true
}

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

##   vnet
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}
variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}
variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}
variable "service_endpoints" {
  description = "The service endpoints for the subnet"
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}


## AKS Cluster
variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}
variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}
# variable "node_count" {
#   description = "The initial number of nodes in the AKS cluster"
#   type        = number
#   default     = 3
# }
variable "vm_size" {
  description = "The size of the virtual machines in the AKS cluster"
  type        = string
  default     = "Standard_DS2_v2"
}
variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB for the AKS cluster nodes"
  type        = number
  default     = 30
}
variable "min_count" {
  description = "The minimum number of nodes in the AKS cluster"
  type        = number
  default     = 1
}
variable "max_count" {
  description = "The maximum number of nodes in the AKS cluster"
  type        = number
  default     = 5
}
variable "windows_admin_username" {
  description = "The administrator username for Windows nodes in the AKS cluster"
  type        = string
  default     = "azureuser"
}
variable "windows_admin_password" {
  description = "The administrator password for Windows nodes in the AKS cluster"
  type        = string
  sensitive   = true
}

## Log Analytics Workspace

variable "workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
  default     = "aks-log-analytics"
  
}

variable "ad_group_name" {
  description = "The name of the Azure AD group for AKS administrators"
  type        = string
  default     = "aks-administrators"
  
}

