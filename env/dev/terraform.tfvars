# Dev environment

/* Tags
  Override Default Tags or Add additional Tags
*/
tags = {
  bizimpact = "high",
  location  = "CentralUS",
}

# Resource Groups
rg = {
  rg-bfx-dev = {
    rg_name  = "rg-dev-cu-001"
    location = "CentralUS"
  }
  rg-bfx-dev-networking = {
    rg_name  = "rg-dev-networking-cu-001"
    location = "CentralUS"
  }
  rg-bfx-dev-infradeploy = {
    rg_name  = "rg-infradeploy-cu-001"
    location = "CentralUS"
  }
}

# Log Analytics Workspaces
log_ws = {
  wk-bfx-shared-cu-003 = {
    rg_name                         = "rg-dev-cu-001"
    location                        = "CentralUS"
    log_analytics_ws_name           = "ws-dev-cu-001"
    sku                             = "PerGB2018"
    retention_in_days               = 30
    allow_resource_only_permissions = false
    daily_quota_gb                  = 1
  }
}

# Application Insights
appins = {
  appins-api-cu-001 = {
    rg_name          = "rg-dev-cu-001"
    appin_name       = "appins-dev-api-cu-001"
    application_type = "web"
    workspace_name   = "ws-dev-cu-001"
  }
  appins-azfn-api-cu-001 = {
    rg_name          = "rg-dev-cu-001"
    appin_name       = "appins-dev-azfn-api-cu-001"
    application_type = "web"
    workspace_name   = "ws-dev-cu-001"
  }
}

# Virtual Networks
vnet = {
  vnet01 = {
    vnet_name     = "vnet-dev-cu-001",
    rg_name       = "rg-dev-networking-cu-001"
    location      = "CentralUS"
    address_space = ["10.105.0.0/16"]
  }
}

# Subnets
subnet = {
  snet_aks = {
    rg_name           = "rg-dev-networking-cu-001"
    location          = "CentralUS"
    vnet_name         = "vnet-dev-cu-001"
    snet_name         = "snet_aks"
    address_prefixes  = ["10.105.0.0/20"]
    service_endpoints = []
  }
  snet_jmp = {
    rg_name           = "rg-dev-networking-cu-001"
    location          = "CentralUS"
    vnet_name         = "vnet-dev-cu-001"
    snet_name         = "snet_jmp"
    address_prefixes  = ["10.105.48.0/24"]
    service_endpoints = ["Microsoft.Storage"]
  }
}


# AKS
aks = {
  aks-dev-001 = {
    rg_name                 = "rg-dev-cu-001"
    networking_rg_name      = "rg-dev-networking-cu-001"
    vnet_name               = "vnet-dev-cu-001"
    subnet_name             = "snet_aks"
    aks_name                = "aks-dev-cu-001"
    ws_name                 = "ws-dev-cu-001"
    dns_prefix              = "dns-aks-dev-cu-001"
    private_cluster_enabled = true
  }
}
