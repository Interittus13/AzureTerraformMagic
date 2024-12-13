# Staging

/* Tags
  Override Default Tags or Add additional Tags
*/
tags = {
  bizimpact : "high",
  location : "CentralUS",
}

# Resource Groups
rg = {
  rg-bfx-staging = {
    rg_name  = "rg-staging-cu-001"
    location = "CentralUS"
  }
  rg-bfx-staging-networking = {
    rg_name  = "rg-stag-networking-cu-001"
    location = "CentralUS"
  }
  rg-bfx-staging-infradeploy = {
    rg_name  = "rg-infradeploy-cu-001"
    location = "CentralUS"
  }
}

# Log Analytics Workspaces
log_ws = {
  wk-bfx-shared-cu-003 = {
    rg_name                         = "rg-staging-cu-001"
    location                        = "CentralUS"
    log_analytics_ws_name           = "ws-staging-cu-001"
    sku                             = "PerGB2018"
    retention_in_days               = 30
    allow_resource_only_permissions = false
    daily_quota_gb                  = 1
  }
}

# Application Insights
appins = {
  appins-api-cu-001 = {
    rg_name          = "rg-staging-cu-001"
    appin_name       = "appins-staging-api-cu-001"
    application_type = "web"
    workspace_name   = "ws-staging-cu-001"
  }
  appins-azfn-api-cu-001 = {
    rg_name          = "rg-staging-cu-001"
    appin_name       = "appins-staging-azfn-api-cu-001"
    application_type = "web"
    workspace_name   = "ws-staging-cu-001"
  }
}

# Virtual Networks
vnet = {
  vnet01 = {
    vnet_name     = "vnet-staging-cu-001",
    rg_name       = "rg-stag-networking-cu-001"
    location      = "CentralUS"
    address_space = ["10.105.0.0/16"]
  }
}


# # user-assigned identity
# uai = {
#   uai-bfx-shared = {
#     rg_name  = "rg-bfx-shared-cu-003"
#     location = "CentralUS"
#     uai_name = "uai-bfx-cu-003"
#   }
#   mg-bfx-shared-nonprod-001 = {
#     rg_name  = "rg-bfx-shared-cu-003"
#     location = "CentralUS"
#     uai_name = "mg-bfx-shared-nonprod-001"
#   }
# }
