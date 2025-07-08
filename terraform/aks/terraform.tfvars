
resource_group_name = "aksrg"
location            = "East US"
environment         = "Terraform"
created_by          = "siva balaji"


vnet_name            = "aks-vnet"
subnet_name          = "aks-subnet"
vnet_address_space   = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]
service_endpoints    = ["Microsoft.ContainerService"]   
tags = {
  Environment = "dev"
  CreatedBy   = "siva"
}
