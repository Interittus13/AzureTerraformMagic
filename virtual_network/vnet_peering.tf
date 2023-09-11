data "azurerm_virtual_network" "Terraform_Assignment" {
  for_each            = { for f, k in var.virtual_network_peering : f => k if k.enable_peering }
  name                = each.value.remote_virtual_network_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_network_peering" "Terraform_Assignment" {
  /* Since i didn't created a seperate folder for peering so, Everytime I want to create VNET it will also run this peering file
    and I don't want peering everytime. Thats why I'm using FOR with IF condition 
    cause Terraform gives error when using count with for_each
  */

  # count                     = var.enable_peering ? 0 : 1
  for_each                  = { for f, k in var.virtual_network_peering : f => k if k.enable_peering }
  name                      = each.value.peering_name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = data.azurerm_virtual_network.Terraform_Assignment[each.key].id
}
