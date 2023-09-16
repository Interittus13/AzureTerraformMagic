resource "azurerm_mssql_server" "Terrasorm_Assignment" {
  for_each                     = { for f, k in var.mssql : f => k if !k.use_existing_sql_server }
  name                         = each.value.sql_server_name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  version                      = each.value.version
  administrator_login          = each.value.admin_name
  administrator_login_password = each.value.admin_password

  # azuread_administrator {
  #   azuread_authentication_only = false
  #   login_username              = each.value.login_username
  #   object_id                   = data.azurerm_aadb2c_directory.Terrasorm_Assignment[each.key].id
  #   tenant_id                   = data.azurerm_aadb2c_directory.Terrasorm_Assignment[each.key].tenant_id
  # }
  connection_policy                            = each.value.connection_policy
  transparent_data_encryption_key_vault_key_id = each.value.encrypted_vault_key_id
  minimum_tls_version                          = each.value.minimum_tls_version
  public_network_access_enabled                = each.value.public_network_access_enabled
  outbound_network_restriction_enabled         = each.value.outbound_network_restriction_enabled
  tags                                         = each.value.tags
}

data "azurerm_mssql_server" "Terrasorm_Assignment" {
  for_each            = { for f, k in var.mssql : f => k if k.use_existing_sql_server }
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}
