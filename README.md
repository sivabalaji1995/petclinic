# 🏥 Petclinic Terraform Deployment with Azure + Vault + GitHub OIDC

This project demonstrates how to securely authenticate to **Azure** using **HashiCorp Vault** and **OIDC-based federated identity from GitHub Actions**, avoiding the use of long-lived client secrets.


## 📦 Project Structure

.
├── main.tf
├── providers.tf
├── variables.tf
├── versions.tf

## 🔐 Secure Azure Credentials Using HashiCorp Vault with Terraform

### ✅ Prerequisites

- [Docker](https://www.docker.com/)
- [Vault CLI](https://developer.hashicorp.com/vault/downloads)
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)

### ⚙️ 1. Run Vault in Dev Mode via Docker

```
docker run --cap-add=IPC_LOCK -d -p 8200:8200 --name vault \
  -e VAULT_DEV_ROOT_TOKEN_ID=root \
  -e VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200 \
  hashicorp/vault:latest
```

🟢 Vault UI: http://127.0.0.1:8200  
🔐 Dev Token: root

## Need to export the values inside the syatem
```

export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="root"

```

## Way to put the secerts inside the vault
```
vault kv put secret/azure \
  client_id="xxxx" \
  client_secret="yyyy" \
  tenant_id="zzzz" \
  subscription_id="aaaa"
```
Below is the way to to define in terrform to use the secrets inside the vault.

```
terraform {
  required_providers {

     vault = {
       source  = "hashicorp/vault"
       version = "~> 3.0"
     }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terrabackend2025"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}

# provider "vault" {
#   address = "http://localhost:8200"
# }

# data "vault_kv_secret_v2" "azure" {
#   mount = "secret"
#   name  = "azure"
# }
# Provider configuration for Azure
# This provider block is used to authenticate with Azure using the provided credentials.
provider "azurerm" {
  features {}
   client_id       = data.vault_kv_secret_v2.azure.data["client_id"]
   tenant_id       = data.vault_kv_secret_v2.azure.data["tenant_id"]
   subscription_id = data.vault_kv_secret_v2.azure.data["subscription_id"]
   client_secret = data.vault_kv_secret_v2.azure.data["client_secret"]
  
}

variables.tf

variable "vault_addr" {
  default = "http://127.0.0.1:8200"
```
---
## 🤝 Authenticating to Azure Using OIDC from GitHub Actions

### 🔐 What is OIDC (OpenID Connect)?

**OIDC** is an authentication protocol built on top of **OAuth 2.0** that allows secure identity verification using third-party identity providers like **GitHub**, **Google**, or **AWS**.

It enables tools like **GitHub Actions** to securely access **Azure** without using secrets.

---

### 🔗 Federation = Trust

To use OIDC with Azure, you need to **establish a federated trust** between:

- ✅ **GitHub** as the OIDC identity provider  
- ✅ **Azure Entra ID (Azure AD)** as the token issuer

---

### 🛠 Use Case: GitHub Actions → Azure via OIDC

#### ✅ Steps to Configure:

1. Go to **Azure Portal** → **App Registrations** → _[your app]_ → **Federated credentials**
2. Click **Add Credential**
3. Fill in the following fields:

| Field   | Value |
|---------|-------|
| **Name** | `github-federation` |
| **Issuer** | `https://token.actions.githubusercontent.com` |
| **Subject** | `repo:<OWNER>/<REPO>:ref:refs/heads/main` <br> *(or)* `repo:<OWNER>/<REPO>:environment:<ENV>` |
| **Audience** | `api://AzureADTokenExchange` |

---

### 🧪 GitHub Actions Example

```yaml
- name: Azure Login
  uses: azure/login@v1
  with:
    client-id: ${{ secrets.AZURE_CLIENT_ID }}
    tenant-id: ${{ secrets.AZURE_TENANT_ID }}
    subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
```
---
## Issue in creating ad group from terraform
---
## ❌ Error: Authorization_RequestDenied

`Authorization_RequestDenied: Insufficient privileges to complete the operation.`  
Means that the identity (user or service principal) running your Terraform code does **not have permission** to create **Azure AD groups**.

---

### 🔍 Root Cause

Terraform is trying to create an Azure AD group with this block:

```hcl
resource "azuread_group" "aks_administrators" {
  display_name     = "myaks-ad-group"
  security_enabled = true
}
```

This requires Microsoft Graph API permissions like:

- `Group.ReadWrite.All`
- *(and optionally)* `Directory.ReadWrite.All`

---

If you're using:

- A **user identity** → your user must be assigned one of those roles.
- A **service principal or federated identity (OIDC)** → the app registration must be granted and consented to the required API permissions.

---

## ✅ Fix Options

### Option 1: ✅ Assign Required Role to the Logged-In User (for manual runs)

Make sure the user running `terraform apply` has:

- The **"Group Administrator"** role  
  or  
- A **custom role** that includes:
  - `Group.ReadWrite.All`
  - `Directory.ReadWrite.All`

📍 You can check and assign roles here:  
👉 [https://entra.microsoft.com](https://entra.microsoft.com) → **Azure Active Directory** → **Roles and administrators**

---

### Option 2: ✅ Add Required Microsoft Graph API Permissions to the App (for automation)

If you’re using **GitHub OIDC** or a **Service Principal**:

1. Go to your **App Registration** in **Entra ID**
2. Go to **API permissions**
3. Click **Add a permission** → **Microsoft Graph**
4. Add:
   - `Group.ReadWrite.All` (Application permission)
5. Click **Grant admin consent** for the tenant






