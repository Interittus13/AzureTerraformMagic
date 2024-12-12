# Staging

# account-info variables
account_info = {
  subscription_id : "db349500-42dc-484d-8f42-28157bc01930"
}

tags = {
  bizimpact : "high",
  dept : "IT",
  email : "arpit@gmail.com",
  env : "nonprod",
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
# log_ws = {
#   wk-bfx-shared-cu-003 = {
#     rg_name                         = "rg-bfx-shared-cu-003"
#     location                        = "CentralUS"
#     log_analytics_ws_name           = "wk-bfx-shared-cu-003"
#     sku                             = "PerGB2018"
#     retention_in_days               = 30
#     allow_resource_only_permissions = false
#     daily_quota_gb                  = 1
#   }
# }

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

#   # TESTING
#   # mg-bfx-shared-nonprod-099-test = {
#   #   rg_name  = "rg-bfx-test-cu-099"
#   #   location = "CentralUS"
#   #   uai_name = "mg-shared-nonprod-099"
#   # }
# }
