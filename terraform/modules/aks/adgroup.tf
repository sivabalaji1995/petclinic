data "azuread_client_config" "current" {}


resource "azuread_group" "aks_administrators" {
  display_name     = var.ad_group_name
  security_enabled = true
  owners           = [data.azuread_client_config.current.object_id]
  description      = "AKS Administrators Group"
}

resource "azurerm_role_assignment" "aks_administrator" {
  scope                = azurerm_kubernetes_cluster.aks.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = azuread_group.aks_administrators.object_id
  
}
