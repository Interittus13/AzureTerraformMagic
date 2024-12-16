resource "azurerm_powerbi_embedded" "bfx3_greenfield_power_bi" {
  for_each            = var.power_bi
  name                = each.value.power_bi_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku_name            = each.value.sku
  administrators      = each.value.administrators
  mode                = each.value.mode
  tags = merge(var.tags)

  lifecycle {
    ignore_changes = [mode]
  }
}
