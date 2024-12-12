resource "azurerm_resource_group" "bfx3_greenfield_resource_group" {
  for_each = var.rg
  name     = each.value.rg_name
  location = each.value.location
  tags     = var.tags

  lifecycle {
    ignore_changes = [ tags["createdOn"] ]
  }
}
