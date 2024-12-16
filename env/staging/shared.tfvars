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

# Subnets
subnet = {
  snet_aks = {
    rg_name           = "rg-stag-networking-cu-001"
    location          = "CentralUS"
    vnet_name         = "vnet-staging-cu-001"
    snet_name         = "snet_aks"
    address_prefixes  = ["10.105.0.0/20"]
    service_endpoints = []
  }
  snet_agw = {
    rg_name           = "rg-stag-networking-cu-001"
    location          = "CentralUS"
    vnet_name         = "vnet-staging-cu-001"
    snet_name         = "snet_agw"
    address_prefixes  = ["10.105.16.0/27"]
    service_endpoints = []
  }
  snet_jmp = {
    rg_name           = "rg-stag-networking-cu-001"
    location          = "CentralUS"
    vnet_name         = "vnet-staging-cu-001"
    snet_name         = "snet_jmp"
    address_prefixes  = ["10.105.48.0/24"]
    service_endpoints = ["Microsoft.Storage"]
  }
}


# AKS
aks = {
  aks-staging-001 = {
    rg_name                          = "rg-staging-cu-001"
    networking_rg_name               = "rg-stag-networking-cu-001"
    vnet_name                        = "vnet-staging-cu-001"
    subnet_name                      = "snet_aks"
    aks_name                         = "aks-staging-cu-001"
    agw_name                         = "agw-staging-cu-001"
    ws_name                          = "ws-staging-cu-001"
    dns_prefix                       = "dns-aks-staging-cu-001"
    private_cluster_enabled          = true
    default_np_vm_size               = "standard_d32s_v3"
    np_network_plugin                = "azure"
    np_network_policy                = "azure"
    np_load_balancer_sku             = "standard"
    np_dns_service_ip                = "10.0.0.10"
    np_service_cidr                  = "10.0.0.0/16"
    rbac_enabled                     = true
    rbac_managed                     = true
    azure_rbac_enabled               = true
    kv_secret_rotation_enabled       = true
    dom                              = 0
    dow                              = "Sunday"
    duration                         = 4
    frequency                        = "Weekly"
    interval                         = 1
    start_date                       = "2024-09-29T00:00:00Z"
    start_time                       = "00:00"
    utc_offset                       = "+00:00"
    azure_policy_enabled             = false
    kubernetes_version               = "1.29.8"
    ca_trust_certificates_base64     = []
    http_application_routing_enabled = false
  }
}
