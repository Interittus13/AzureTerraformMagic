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
    api_definition_url            = optional(string)
    api_management_api_id         = optional(string)
    app_command_line              = optional(string)
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
    action_type                       = optional(string, "Recycle") # LogEvent, CustomAction for windows
    executable                        = optional(string, "log.exe") # for Windows type
    parameters                        = optional(string) # for Windows type
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
    allowed_origins                   = optional(list(string))
    support_credentials               = optional(bool, false)
    backup_enabled                    = optional(bool, false)
    backup_interval                   = optional(number, 7)
    backup_unit                       = optional(string, "Day")
    keep_at_least_one_backup          = optional(bool, false)
    backup_retention_period           = optional(number, 30)
    backup_start_time                 = optional(string)
    storage_account_url               = optional(string)
    logs_level                        = optional(string, "Error") # Error, Warning, Information, Verbose, Off
    logs_retention_days               = optional(number, 10)
    sas_url                           = optional(string)
    file_system_level                 = optional(string, "Error") # Verbose, Information, Warning, Error
    detailed_error_messages           = optional(bool, false)
    failed_request_tracing            = optional(bool, false)
    logs_file_size                    = optional(string)
    connection_strings = map(object({
      conn_name  = optional(string)
      conn_type  = optional(string) # MySQL, SQLServer, SQLAzure, Custom, NotificationHub, ServiceBus, EventHub, APIHub, DocDb, RedisCache, PostgreSQL
      conn_value = optional(string)
    }))
    identity_type                      = optional(string, "SystemAssigned") # SystemAssigned, UserAssigned
    identity_ids                       = optional(list(string))
    client_affinity_enabled            = optional(bool, false)
    client_certificate_enabled         = optional(bool, false)
    client_certificate_mode            = optional(string, "Optional") # Required, Optional, OptionalInteractiveUser
    client_certificate_exclusion_paths = optional(string)             # ; seperated
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
