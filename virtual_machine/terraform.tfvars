azure_vm = {
  vm1 = {
    allocate_pip                    = true
    pip_name                        = "Arpit-pip1"
    nic_name                        = "Arpit-nic1"
    subnet_name                     = "vnet01_subnet01"
    vnet_name                       = "Arpit_vnet01"
    resource_group_name             = "ArpitRG"
    vm_name                         = "ArpitVM1"
    size                            = "Standard_B1s"
    os_publisher                    = "Canonical"
    os_offer                        = "0001-com-ubuntu-server-focal"
    os_sku                          = "20_04-lts"
    disable_password_authentication = false
    os_type                         = "linux"
    # admin_username      = "arpitadmin"
    # admin_password      = ""
  },
  vm2 = {
    allocate_pip        = false
    # pip_name            = "Arpit-pip2"
    nic_name            = "Arpit-nic1"
    subnet_name         = "vnet01_subnet01"
    vnet_name           = "Arpit_vnet01"
    resource_group_name = "ArpitRG"
    vm_name             = "ArpitVM2"
    size                = "Standard_B1s"
    os_publisher        = "MicrosoftWindowsDesktop"
    os_offer            = "Windows-10"
    os_sku              = "20h2-pro"
    os_type             = "windows"
  }
}

vault_name = "keyvault-team"
vault_rg   = "keyvault_rg"
