output "versions" {
  value = data.azurerm_kubernetes_service_versions.aks_versions.versions
}

output "latest_version" {
  value = data.azurerm_kubernetes_service_versions.aks_versions.latest_version
}