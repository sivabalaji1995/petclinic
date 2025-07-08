

module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vnet" {
  source              = "../modules/vnet"
  vnetname            = var.vnet_name
  subnetname          = var.subnet_name
  address_space       = var.vnet_address_space
  address_prefixes    = var.subnet_address_prefixes
  service_endpoints   = var.service_endpoints
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}