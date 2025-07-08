variable "vault_addr" {
  default = "http://127.0.0.1:8200"
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
  default     = ["Microsoft.ContainerService"]
}
variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {
    Environment = var.environment
    CreatedBy   = var.created_by
  }
}

