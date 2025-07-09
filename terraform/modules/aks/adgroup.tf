data "azuread_client_config" "current" {}


resource "azuread_group" "aks_administrators" {
  display_name     = var.ad_group_name
  security_enabled = true
  owners           = [data.azuread_client_config.current.object_id]
  description      = "AKS Administrators Group"
}
