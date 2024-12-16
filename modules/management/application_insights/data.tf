# Fetching workspace for application insight
data "azurerm_log_analytics_workspace" "existing_ws" {
  for_each            = var.appins
  name                = each.value.workspace_name
  resource_group_name = each.value.rg_name
}