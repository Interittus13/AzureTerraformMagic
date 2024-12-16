variable "tags" {
  type = map(string)
  default = {}
}

# Resource Group
variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}

# Log Analytics Workspace
variable "log_ws" {
  type = map(object({
    rg_name               = string
    location              = string
    log_analytics_ws_name = string
    daily_quota_gb        = number
    retention_in_days     = number
    sku                   = string
  }))
}

# Application Insights
variable "appins" {
  type = map(object({
    rg_name          = string
    location         = optional(string, "CentralUS")
    appin_name       = string
    application_type = string
    workspace_name   = string
  }))
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

# Subnets
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

/* modules/containers */

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
