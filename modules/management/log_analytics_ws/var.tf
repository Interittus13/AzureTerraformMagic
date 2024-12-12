variable "tags" {
  type = map(string)
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
