app_service = {
  "app01" = {
    deploy_web_app            = false
    use_existing_service_plan = false
    app_name                  = "arpit-app01"
    service_plan_name         = "arpit-app-service01"
    resource_group_name       = "ArpitRG"
    location                  = "east asia"
    connection_strings = {}
  }
}

static_site = {
  "site01" = {
    deploy_static_site  = false
    resource_group_name = "ArpitRG"
    site_name           = "arpit-devops"
  }
}
