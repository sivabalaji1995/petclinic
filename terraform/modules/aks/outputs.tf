output "versions" {
  value = data.azure_kubernetes_service_versions.aks_versions.versions
}

output "latest_version" {
  value = data.azure_kubernetes_service_versions.aks_versions.latest_version
}