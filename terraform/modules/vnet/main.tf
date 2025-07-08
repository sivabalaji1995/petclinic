resource "azurerm_virtual_network" "aksvnet" {
  name                = var.vnetname
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints

}
    

