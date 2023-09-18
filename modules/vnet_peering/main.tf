data "azurerm_virtual_network" "Terraform_Assignment" {
  for_each            = var.vnet_peering
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_network_peering" "Terraform_Assignment" {
  for_each                  = var.vnet_peering
  name                      = each.value.peering_name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.Terraform_Assignment[each.key].id
}
