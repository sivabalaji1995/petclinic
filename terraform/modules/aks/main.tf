

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = data.azurerm_kubernetes_service_versions.aks_versions.latest_version
  default_node_pool {
    name                 = "default"
    # node_count           = var.node_count
    vm_size              = var.vm_size
    os_disk_size_gb      = var.os_disk_size_gb
    type                 = "VirtualMachineScaleSets"
    enable_auto_scaling = true 
    min_count            = var.min_count
    max_count            = var.max_count

  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  # azure_policy_enabled = true
   
  oidc_issuer_enabled         = true
  workload_identity_enabled   = true

  key_vault_secrets_provider {
   
    secret_rotation_enabled = true  # Optional: rotates secrets automatically
  }
  

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = [azuread_group.aks_administrators.object_id]
    azure_rbac_enabled     = true
  }

  # windows_profile  
  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }
  #  network profile 

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    load_balancer_profile {
      managed_outbound_ip_count = 1
    }
  }

  tags = var.tags

}