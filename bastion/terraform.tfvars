azure_bastion = {
  "bastion01" = {
    address_prefixes     = ["10.0.3.0/27"]
    bastion_name         = "Arpit_vnet01-bastion"
    pip_name             = "Arpit_vnet01-pip"
    resource_group_name  = "ArpitRG"
    virtual_network_name = "Arpit_vnet01"
  }
}
