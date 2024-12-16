resource "azurerm_container_registry" "acr" {
  for_each                      = var.acr
  name                          = each.value.acr_name
  resource_group_name           = each.value.rg_name
  location                      = each.value.location
  sku                           = each.value.sku
  admin_enabled                 = each.value.admin_enabled
  public_network_access_enabled = each.value.public_network_access_enabled

  georeplications {
    location                = each.value.sec_location
    zone_redundancy_enabled = each.value.zone_redundancy_enabled
  }

  tags = var.tags
}
