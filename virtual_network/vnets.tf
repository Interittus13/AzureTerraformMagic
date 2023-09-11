resource "azurerm_virtual_network" "Terraform_Assignment" {
  for_each            = var.virtual_network
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnets # var.azurerm_virtual_network
    content {
      name           = subnet.value.subnet_name
      address_prefix = subnet.value.address_prefix
      # security_group = 
    }
  }

  tags = each.value.tags
}

