module "locals" {
  source = "../../locals"
}

resource "azurerm_load_test" "azurerm_load_testing" {
  for_each            = var.load_testing
  resource_group_name = each.value.rg_name
  location            = each.value.location
  name                = each.value.name
  description         = each.value.description

  identity {
    type = each.value.identity
  }

  tags = merge(module.locals.defaultTags, var.tags)

  lifecycle {
    ignore_changes = [tags["createdOn"]]
  }
}
