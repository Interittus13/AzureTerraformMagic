variable "azure_bastion" {
  type = map(object({
    virtual_network_name   = string
    address_prefixes       = list(string)
    pip_name               = string
    pip_allocation_method  = optional(string, "Static")
    pip_sku                = optional(string, "Standard")
    bastion_name           = string
    location               = optional(string, "central india")
    resource_group_name    = string
    copy_paste_enabled     = optional(bool, true)
    file_copy_enabled      = optional(bool, false)
    bastion_sku            = optional(string, "Standard")
    ip_name                = optional(string, "configuration")
    ip_connect_enabled     = optional(bool, false)
    scale_units            = optional(number, 2)
    shareable_link_enabled = optional(bool, false)
    tunneling_enabled      = optional(bool, false)
    tags                   = optional(map(string))
  }))
}
