variable "workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
  
}
variable "location" {
  description = "The Azure region where the Log Analytics workspace will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the Log Analytics workspace will be created."
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the Log Analytics workspace."
  type        = map(string)
  default     = {}
}