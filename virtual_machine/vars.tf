# common for Linux and Windows
variable "azure_vm" {
  type = map(object({
    allocate_pip                    = bool
    pip_name                        = optional(string)
    nic_name                        = string
    location                        = optional(string, "central india")
    subnet_name                     = string
    vnet_name                       = string
    resource_group_name             = string
    vm_name                         = string
    size                            = optional(string, "Standrad_B1s")
    caching                         = optional(string, "ReadWrite")
    storage_account_type            = optional(string, "Standard_LRS")
    os_publisher                    = string
    os_offer                        = string
    os_sku                          = string
    os_version                      = optional(string, "latest")
    disable_password_authentication = optional(bool, true) # Only applicable in Linux VMs.. True means we are using SSH keys
    os_type                         = string
    # admin_username = string
    # admin_password = string
  }))
}

variable "vault_name" {

}

variable "vault_rg" {
  
}