resource "azurerm_mssql_database" "Terrasorm_Assignment" {
  for_each                            = var.mssql
  name                                = each.value.db_name
  server_id                           = each.value.use_existing_sql_server ? data.azurerm_mssql_server.Terrasorm_Assignment[each.key].id : azurerm_mssql_server.Terrasorm_Assignment[each.key].id
  collation                           = each.value.collation
  geo_backup_enabled                  = each.value.geo_backup_enabled
  maintenance_configuration_name      = each.value.maintenance_configuration_name
  ledger_enabled                      = each.value.ledger_enabled
  license_type                        = each.value.license_type
  max_size_gb                         = each.value.max_size_gb
  read_scale                          = each.value.read_scale
  sku_name                            = each.value.db_sku
  transparent_data_encryption_enabled = each.value.transparent_data_encryption_enabled
  zone_redundant                      = each.value.zone_redundant
  #   long_term_retention_policy {

  #   }

  tags = each.value.tags
}
