resource "azurerm_log_analytics_workspace" "bfx3_greenfield_log_ws" {
  for_each            = var.log_ws
  name                = each.value.log_analytics_ws_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = each.value.sku
  daily_quota_gb      = each.value.daily_quota_gb
  retention_in_days   = each.value.retention_in_days
  tags                = var.tags
}
