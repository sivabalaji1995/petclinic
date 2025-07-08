resource "azurerm_resource_group" "aksrg" {
    name     = var.resource_group_name
    location = var.location

    tags = var.tags
}