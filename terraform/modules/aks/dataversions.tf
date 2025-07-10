data "azurerm_kubernetes_service_versions" "aks_versions" {
  location        = var.location
  include_preview = false
}