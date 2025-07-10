output "analytics_namespace" {
  value = azurerm_log_analytics_workspace.insights.name
  
}
output "analytics_id" {
  value = azurerm_log_analytics_workspace.insights.id
}