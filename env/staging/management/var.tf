# account-info variables
variable "account_info" {
  type = object({
    subscription_id = string
  })
}

# variable "currentDate" {
#   type = string
# }

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
# variable "log_ws" {
#   type = map(object({
#     rg_name               = string
#     location              = string
#     log_analytics_ws_name = string
#     daily_quota_gb        = number
#     retention_in_days     = number
#     sku                   = string
#     tags = optional(map(string), {
#       "bizimpact" : "medium",
#       "date" : "03/02/2023",
#       "dept" : "IT",
#       "email" : "noreply@bomerangfx.com",
#       "env" : "prod",
#       "location" : "CentralUS",
#       "owner" : "BoomerangFX"
#     })
#   }))
# }

# # user-assigned identity
# variable "uai" {
#   type = map(object({
#     rg_name  = string
#     location = string
#     uai_name = string
#   }))
# }
