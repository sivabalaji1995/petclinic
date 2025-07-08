output "client_id" {
  value     = data.vault_kv_secret_v2.azure.data["client_id"]
  sensitive = true
}
output "tenant_id" {
  value     = data.vault_kv_secret_v2.azure.data["tenant_id"]
  sensitive = true
}
output "subscription_id" {
  value     = data.vault_kv_secret_v2.azure.data["subscription_id"]
  sensitive = true
}




