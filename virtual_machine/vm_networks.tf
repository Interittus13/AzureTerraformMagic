data "azurerm_subnet" "Terraform_Assignment" {
  for_each             = var.azure_vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_public_ip" "Terraform_Assignment" {
  for_each            = { for f, k in var.azure_vm : f => k if k.allocate_pip } 
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "Terraform_Assignment" {
  for_each            = var.azure_vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.Terraform_Assignment[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.allocate_pip ? azurerm_public_ip.Terraform_Assignment[each.key].id : null
  }
}
