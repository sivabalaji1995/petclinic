variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created"
  type        = string
  
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "East US" # Change to your preferred Azure region
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)

}