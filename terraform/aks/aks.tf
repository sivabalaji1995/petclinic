

module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vnet" {
  source           = "../modules/vnet"
  vnetname         = var.vnet_name
  subnetname       = var.subnet_name
  address_space    = var.vnet_address_space
  address_prefixes = var.subnet_address_prefixes
  # service_endpoints   = var.service_endpoints
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "loganalytics" {
  source              = "../modules/loganalytics"
  workspace_name      = var.workspace_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "aks" {
  source              = "../modules/aks"
  cluster_name        = var.cluster_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.dns_prefix
  # node_count          = var.node_count
  vm_size             = var.vm_size
  os_disk_size_gb     = var.os_disk_size_gb
  min_count           = var.min_count
  max_count           = var.max_count
  windows_admin_username = var.windows_admin_username
  windows_admin_password = var.windows_admin_password
  log_analytics_workspace_id = module.loganalytics.analytics_id
  ad_group_name = var.ad_group_name
  tags                 = var.tags
}
