variable "app_service" {
  type = map(object({
    deploy_web_app               = bool
    use_existing_service_plan    = bool
    service_plan_name            = string
    location                     = optional(string, "central india")
    resource_group_name          = string
    os_type                      = optional(string, "Linux")
    app_service_sku              = optional(string, "B1")
    maximum_elastic_worker_count = optional(number, 0)
    worker_count                 = optional(number, 1)
    per_site_scaling_enabled     = optional(bool, false)
    zone_balancing_enabled       = optional(bool, false)
    tags                         = optional(map(string))

    app_name                      = string
    always_on                     = optional(bool, false) # False if using Free, F1, D1 or Shared sku
    enabled                       = optional(bool, true)
    https_only                    = optional(bool, false)
    public_network_access_enabled = optional(bool, true)

    stack_type               = optional(string, "node") # java, dotnet, docker, php, python, ruby, go
    docker_image_name        = optional(string)
    docker_registry_url      = optional(string)
    docker_registry_username = optional(string)
    docker_registry_password = optional(string)
    node_version             = optional(string, "18-lts")
    php_version              = optional(string, "8.2")
    python_version           = optional(string, "3.11")

    auto_heal_enabled                 = optional(bool, false)
    action_type                       = optional(string, "Recycle")
    minimum_process_execution_time    = optional(string) # hh:mm:ss
    count                             = optional(number, 1)
    interval                          = optional(string, "00:30:00") # hh:mm:ss
    time_taken                        = optional(string, "00:30:00") # hh:mm:ss
    path                              = optional(string)
    status_code_range                 = optional(string, "400")
    sub_status                        = optional(number, 0)
    win32_status                      = optional(number, 0)
    ftps_state                        = optional(string, "Disabled") # AllAllowed, FtpsOnly, Disabled
    health_check_path                 = optional(string)
    health_check_eviction_time_in_min = optional(number, 2) # 2 to 10
    http2_enabled                     = optional(bool, false)
    load_balancing_mode               = optional(string, "LeastRequests")
    local_mysql_enabled               = optional(bool, false)
    managed_pipeline_mode             = optional(string, "Integrated") # Classic, Integrated
    minimum_tls_version               = optional(string, "1.2")
    remote_debugging_enabled          = optional(bool, false)
    remote_debugging_version          = optional(string, "VS2019") # VS2017, VS2019
    use_32_bit_worker                 = optional(bool, true)
    vnet_route_all_enabled            = optional(bool, false)
    websockets_enabled                = optional(bool, false)
    worker_count                      = optional(number, 1)
  }))
}

variable "static_site" {
  type = map(object({
    deploy_static_site  = bool
    site_name           = string
    location            = optional(string, "central inida")
    resource_group_name = string
    sku_tier            = optional(string, "Free") # Free, Standard
    sku_size            = optional(string, "Free") # Free, Standard
    type                = optional(string)
    identity_ids        = optional(list(string))
    tags                = optional(map(string))
  }))
}
