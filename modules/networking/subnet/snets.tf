resource "azurerm_subnet" "bfx3_greenfield_subnet" {
  for_each                          = var.subnet
  resource_group_name               = each.value.rg_name
  name                              = each.value.snet_name
  virtual_network_name              = each.value.vnet_name
  address_prefixes                  = each.value.address_prefixes
  private_endpoint_network_policies = each.value.private_link_endpoint
  service_endpoints                 = each.value.service_endpoints
}

# # Network Security Groups
# resource "azurerm_network_security_group" "bfx3_greenfield_nsg" {
#   for_each            = { for f, k in var.subnet : f => k if k.nsg_name != "" }
#   name                = each.value.nsg_name
#   location            = each.value.location
#   resource_group_name = each.value.rg_name
#   dynamic "security_rule" {
#     for_each = each.value.security_rules
#     content {
#       name                                       = security_rule.value.sr_name
#       description                                = security_rule.value.description
#       priority                                   = security_rule.value.priority
#       direction                                  = security_rule.value.direction
#       access                                     = security_rule.value.access
#       protocol                                   = security_rule.value.protocol
#       source_port_range                          = security_rule.value.source_port_range
#       destination_port_range                     = security_rule.value.destination_port_range
#       destination_port_ranges                    = security_rule.value.destination_port_ranges
#       source_address_prefix                      = security_rule.value.source_address_prefix
#       destination_address_prefix                 = security_rule.value.destination_address_prefix
#       destination_application_security_group_ids = security_rule.value.destination_application_security_group_ids
#     }
#   }
#   tags = var.tags
# }

# # subnet-nsg association
# resource "azurerm_subnet_network_security_group_association" "bfx3_greenfield_snet-nsg-association" {
#   for_each                  = { for f, k in var.subnet : f => k if k.nsg_name != "" }
#   subnet_id                 = azurerm_subnet.bfx3_greenfield_subnet[each.key].id
#   network_security_group_id = azurerm_network_security_group.bfx3_greenfield_nsg[each.key].id

#   depends_on = [ azurerm_subnet.bfx3_greenfield_subnet, azurerm_network_security_group.bfx3_greenfield_nsg ]
# }
