# account-info variables
variable "account_info" {
  type = object({
    subscription_id = string
  })
}

variable "tags" {
  type = map(string)
}

# Resource Group
variable "rg" {
  type = map(object({
    rg_name  = string
    location = string
    tags     = optional(map(string))
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

# # user-assigned identity
# variable "uai" {
#   type = map(object({
#     rg_name  = string
#     location = string
#     uai_name = string
#   }))
# }
