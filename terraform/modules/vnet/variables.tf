variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "vnetname" {
  description = "The name of the virtual network."
  type        = string
  
}
variable "subnetname" {
  description = "The name of the subnet."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)    
  
}
variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
} 
variable "service_endpoints" {
  description = "The service endpoints for the subnet."
  type        = list(string)
  default     = []
} 

variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be created."
  type        = string
  
}
