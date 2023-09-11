resource "azurerm_subnet" "Terraform_Assignment" {
  for_each             = var.azure_bastion
  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes

}

resource "azurerm_public_ip" "Terraform_Assignment" {
  for_each            = var.azure_bastion
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.pip_allocation_method
  sku                 = each.value.pip_sku

}

resource "azurerm_bastion_host" "Terraform_Assignment" {
  for_each            = var.azure_bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  copy_paste_enabled  = each.value.copy_paste_enabled
  file_copy_enabled   = each.value.file_copy_enabled
  sku                 = each.value.bastion_sku
  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = azurerm_subnet.Terraform_Assignment[each.key].id
    public_ip_address_id = azurerm_public_ip.Terraform_Assignment[each.key].id
  }
  ip_connect_enabled     = each.value.ip_connect_enabled
  scale_units            = each.value.scale_units
  shareable_link_enabled = each.value.shareable_link_enabled
  tunneling_enabled      = each.value.tunneling_enabled

  tags = each.value.tags

}
