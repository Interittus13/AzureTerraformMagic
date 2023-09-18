rg_module = {
    rg1 = {
        name = "ArpitRG"
    }
}

vnet_module = {
  vnet1 = {
    name                = "Arpit_vnet01"
    resource_group_name = "ArpitRG"
    address_space       = ["10.0.0.0/16"]

    subnets = {
      subnet1 = {
        subnet_name    = "vnet01_subnet01"
        address_prefix = "10.0.1.0/24"
      },
      subnet2 = {
        subnet_name    = "vnet01_subnet02"
        address_prefix = "10.0.2.0/24"
      }
    }
  }
}

peering_module = {
  peering1 = {
    enable_peering = false
    peering_name = "Arpit_vnet01-to-Arpit_vnet02"
    resource_group_name = "ArpitRG"
    virtual_network_name = "Arpit_vnet01"
    remote_virtual_network_name = "Arpit_vnet02"
  },
  peering2 = {
    enable_peering = false
    peering_name = "Arpit_vnet02-to-Arpit_vnet01"
    resource_group_name = "ArpitRG"
    virtual_network_name = "Arpit_vnet02"
    remote_virtual_network_name = "Arpit_vnet01"
  }
}