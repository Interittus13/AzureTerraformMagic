variable "virtual_network" {
  description = "virtual network"

    type = map(object({
      name = string
      location = optional(string, "central india")
      resource_group_name = string
      address_space = list(string)
      dns_servers = optional(list(string))
      tags = optional(map(string))
      subnets = map(object({
        subnet_name = string
        address_prefix = string
      }))
    }))
}

variable "virtual_network_peering" {
  type = map(object({
    enable_peering = bool
    resource_group_name = string
    peering_name = string
    virtual_network_name = string
    remote_virtual_network_name = string
  }))
}
