resource "azurerm_fabric_capacity" "fabric" {
  for_each = var.fabric
  name     = each.value.name
}
