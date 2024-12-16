# variable "tags" {
#   type = map(string)
# }

# Subnets & Network Security Groups
variable "subnet" {
  type = map(object({
    vnet_name             = string
    snet_name             = string
    rg_name               = string
    location              = optional(string, "CentralUS")
    address_prefixes      = list(string)
    private_link_endpoint = optional(string)
    service_endpoints     = optional(list(string), [])
  }))
}