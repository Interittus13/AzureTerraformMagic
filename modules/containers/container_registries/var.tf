variable "tags" {
  type = map(string)
}

# Container Registry
variable "acr" {
  type = map(object({
    rg_name                       = string
    location                      = optional(string, "CentralUS")
    acr_name                      = string
    sku                           = optional(string, "Basic")
    admin_enabled                 = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    zone_redundancy_enabled       = optional(bool, false)
    sec_location                  = string
  }))
}
