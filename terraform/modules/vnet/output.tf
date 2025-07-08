output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.aksvnet.id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.aks_subnet.id
}
output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.aksvnet.name
}