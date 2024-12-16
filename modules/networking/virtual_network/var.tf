variable "tags" {
  type = map(string)
}

# Virtual Networks
variable "vnet" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = optional(string, "CentralUS")
    address_space = list(string)
  }))
}
