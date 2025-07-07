resource "azurerm_resource_group" "aksrg" {
    name     = var.resource_group_name
    location = var.location

    tags = {
        environment = var.environment
        created_by  = var.created_by
    }
}