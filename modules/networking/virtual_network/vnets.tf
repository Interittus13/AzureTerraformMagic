module "locals" {
  source = "../../../modules/locals"
}

resource "azurerm_virtual_network" "bfx3_greenfield_vnet" {
  for_each            = var.vnet
  resource_group_name = each.value.rg_name
  location            = each.value.location
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  tags                = merge(module.locals.defaultTags, var.tags)

  lifecycle {
    ignore_changes = [ tags["createdOn"] ]
  }
}
