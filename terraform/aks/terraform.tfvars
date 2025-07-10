
resource_group_name = "aksrg"
location            = "East US"
environment         = "Terraform"
created_by          = "siva balaji"


vnet_name               = "aks-vnet"
subnet_name             = "aks-subnet"
vnet_address_space      = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]

tags = {
  Environment = "dev"
  CreatedBy   = "siva"
}

# Log Analytics Workspace
workspace_name = "aks-log-analytics"

## AKS Cluster
cluster_name              = "myaks-cluster"
dns_prefix                = "myaks"
# node_count                = 2
vm_size                   = "standard_a2_v2"
os_disk_size_gb           = 30
min_count                 = 1
max_count                 = 3
windows_admin_username    = "azureuser"
windows_admin_password     = "DevOps!P0wer2025"

ad_group_name             = "myaks-ad-group"
