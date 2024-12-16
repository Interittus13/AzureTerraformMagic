variable "tags" {
  type = map(string)
}

# Azure Load Testing
variable "load_testing" {
  type = map(object({
    name        = string
    rg_name     = string
    location    = string
    description = optional(string)
    identity    = optional(string, "SystemAssigned")
  }))
}
