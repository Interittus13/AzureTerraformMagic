variable "tags" {
  type = map(string)
}

# SignalR
variable "signalr" {
  type = map(object({
    rg_name                   = string
    location                  = optional(string, "CentralUS")
    signalr_name              = string
    sku                       = string
    capacity                  = number
    allowed_origins           = list(string)
    http_request_logs_enabled = optional(bool)
    connectivity_logs_enabled = optional(bool)
    messaging_logs_enabled    = optional(bool)
    service_mode              = string
  }))
}
