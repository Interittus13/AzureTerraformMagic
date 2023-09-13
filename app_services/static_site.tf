resource "azurerm_static_site" "Terraform_Assignment" {
  for_each            = { for f, k in var.static_site : f => k if k.deploy_static_site }
  name                = each.value.site_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_tier            = each.value.sku_tier
  sku_size            = each.value.sku_size
  identity {
    type         = each.value.type
    identity_ids = each.value.identity_ids
  }
  tags = each.value.tags

}
