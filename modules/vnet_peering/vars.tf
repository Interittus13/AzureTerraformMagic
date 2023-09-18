variable "vnet_peering" {
  type = map(object({
    resource_group_name = string
    peering_name = string
    virtual_network_name = string
    remote_virtual_network_name = string
  }))
}
