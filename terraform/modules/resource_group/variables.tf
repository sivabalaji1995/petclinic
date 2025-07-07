variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created"
  type        = string
  
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "East US" # Change to your preferred Azure region
}

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