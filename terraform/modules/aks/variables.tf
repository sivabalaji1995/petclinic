
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

variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created"
  type        = string
}
variable "location" {
  description = "The Azure region where the AKS cluster will be created"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to be used by the AKS cluster"

}

variable "ad_group_name" {
  description = "The name of the Azure Active Directory group for AKS administrators"
  type        = string
}

