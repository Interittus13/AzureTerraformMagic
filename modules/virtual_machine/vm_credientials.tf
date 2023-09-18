data "azurerm_key_vault" "Terraform_Assignment" {
  name                = var.vault_name
  resource_group_name = var.vault_rg
}

# for Fetching multiples secrets at once
data "azurerm_key_vault_secrets" "Terraform_Assignment" {
  key_vault_id = data.azurerm_key_vault.Terraform_Assignment.id
}

data "azurerm_key_vault_secret" "Terraform_Assignment" {
  for_each     = toset(data.azurerm_key_vault_secrets.Terraform_Assignment.names)
  name         = each.key
  key_vault_id = data.azurerm_key_vault.Terraform_Assignment.id
}