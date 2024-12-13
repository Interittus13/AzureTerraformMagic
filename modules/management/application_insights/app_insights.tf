module "locals" {
  source = "../../../modules/locals"
}

resource "azurerm_application_insights" "bfx3_greenfield_app_insights" {
  for_each            = var.appins
  name                = each.value.appin_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  application_type    = each.value.application_type
  workspace_id        = data.azurerm_log_analytics_workspace.existing_ws[each.key].id
  tags = merge(module.locals.defaultTags, var.tags)
  
  lifecycle {
    ignore_changes = [ tags["createdOn"] ]
  }
}
