variable "tags" {
  type = map(string)
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

