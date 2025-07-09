variable "windows_admin_password" {
  description = "The password for the Windows administrator."
  type        = string
  sensitive   = true    
  
}

variable "windows_admin_username" {
  description = "The username for the Windows administrator."
  type        = string
  default     = "azure"
  
}
