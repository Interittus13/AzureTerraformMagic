variable "tags" {
  type = map(string)
}

# Power Bi
variable "power_bi" {
  type = map(object({
    rg_name        = string
    location       = optional(string, "CentralUS")
    power_bi_name  = string
    sku            = string
    administrators = list(string)
    mode           = string
  }))
}
