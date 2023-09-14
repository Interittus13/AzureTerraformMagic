resource "azurerm_linux_web_app" "Terraform_Assignment" {
  for_each            = { for f, k in var.app_service : f => k if k.deploy_web_app && k.os_type == "Linux" }
  name                = each.value.app_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  service_plan_id     = each.value.use_existing_service_plan ? data.azurerm_service_plan.Terraform_Assignment[each.key].id : azurerm_service_plan.Terraform_Assignment[each.key].id
  site_config {
    always_on             = each.value.always_on
    api_definition_url    = each.value.api_definition_url
    api_management_api_id = each.value.api_management_api_id
    app_command_line      = each.value.app_command_line
    application_stack {
      docker_image_name        = each.value.stack_type == "docker" ? each.value.docker_image_name : null
      docker_registry_url      = each.value.stack_type == "docker" ? each.value.docker_registry_url : null
      docker_registry_username = each.value.stack_type == "docker" ? each.value.docker_registry_username : null
      docker_registry_password = each.value.stack_type == "docker" ? each.value.docker_registry_password : null

      node_version   = each.value.stack_type == "node" ? each.value.node_version : null
      php_version    = each.value.stack_type == "php" ? each.value.php_version : null
      python_version = each.value.stack_type == "python" ? each.value.python_version : null
    }
    auto_heal_enabled = each.value.auto_heal_enabled
    auto_heal_setting {
      action {
        action_type                    = each.value.action_type
        minimum_process_execution_time = each.value.minimum_process_execution_time
      }
      trigger {
        requests {
          count    = each.value.count
          interval = each.value.interval
        }
        slow_request {
          count      = each.value.count
          interval   = each.value.interval
          time_taken = each.value.time_taken
          path       = each.value.path
        }
        status_code {
          count             = each.value.count
          interval          = each.value.interval
          status_code_range = each.value.status_code_range
          path              = each.value.path
          sub_status        = each.value.sub_status
          win32_status      = each.value.win32_status
        }
      }
    }
    ftps_state                        = each.value.ftps_state
    health_check_path                 = each.value.health_check_path
    health_check_eviction_time_in_min = each.value.health_check_eviction_time_in_min
    http2_enabled                     = each.value.http2_enabled
    load_balancing_mode               = each.value.load_balancing_mode
    local_mysql_enabled               = each.value.local_mysql_enabled
    managed_pipeline_mode             = each.value.managed_pipeline_mode
    minimum_tls_version               = each.value.minimum_tls_version
    remote_debugging_enabled          = each.value.remote_debugging_enabled
    remote_debugging_version          = each.value.remote_debugging_version
    use_32_bit_worker                 = each.value.use_32_bit_worker
    vnet_route_all_enabled            = each.value.vnet_route_all_enabled
    websockets_enabled                = each.value.websockets_enabled
    worker_count                      = each.value.worker_count

    cors {
      allowed_origins     = each.value.allowed_origins
      support_credentials = each.value.support_credentials
    }

    # dynamic "ip_restriction" {
    #   for_each = each.value.ip_restrictions

    #   content {
    #     action = "value"
    #     headers = [{
    #       x_azure_fdid      = ["value"]
    #       x_fd_health_probe = ["value"]
    #       x_forwarded_for   = ["value"]
    #       x_forwarded_host  = ["value"]
    #     }]
    #     ip_address                = "value"
    #     name                      = "value"
    #     priority                  = 0
    #     service_tag               = "value"
    #     virtual_network_subnet_id = "value"
    #   }
    # }

    # container_registry_managed_identity_client_id = "value"
    # container_registry_use_managed_identity = false
    # default_documents = [ "value" ]

    # scm_ip_restriction {
    # }
    # scm_minimum_tls_version = "value"
    # scm_use_main_ip_restriction = false
  }
  enabled                       = each.value.enabled
  https_only                    = each.value.https_only
  public_network_access_enabled = each.value.public_network_access_enabled

  client_affinity_enabled            = each.value.client_affinity_enabled
  client_certificate_enabled         = each.value.client_certificate_enabled
  client_certificate_mode            = each.value.client_certificate_mode
  client_certificate_exclusion_paths = each.value.client_certificate_exclusion_paths

  dynamic "connection_string" {
    for_each = each.value.connection_strings

    content {
      name  = connection_string.value.conn_name
      type  = connection_string.value.conn_type
      value = connection_string.value.conn_value
    }
  }

  identity {
    type         = each.value.identity_type
    identity_ids = each.value.identity_ids
  }

  /* Optional attritubes have some required sub-attributes when expanded */

  # backup {
  #   enabled = each.value.backup_enabled
  #   name    = "${each.value.app_name}-backup"
  #   schedule {
  #     frequency_interval       = each.value.backup_interval
  #     frequency_unit           = each.value.backup_unit
  #     keep_at_least_one_backup = each.value.keep_at_least_one_backup
  #     retention_period_days    = each.value.backup_retention_period
  #     start_time               = each.value.backup_start_time
  #   }
  #   storage_account_url = each.value.storage_account_url
  # }

  # logs {
  #   application_logs {
  #     azure_blob_storage {
  #       level             = each.value.logs_level
  #       retention_in_days = each.value.logs_retention_days
  #       sas_url           = each.value.sas_url
  #     }
  #     file_system_level = each.value.file_system_level
  #   }
  #   detailed_error_messages = each.value.detailed_error_messages
  #   failed_request_tracing  = each.value.failed_request_tracing
  #   http_logs {
  #     azure_blob_storage {
  #       retention_in_days = each.value.logs_retention_days
  #       sas_url           = each.value.sas_url
  #     }

  #     file_system {
  #       retention_in_days = each.value.logs_retention_days
  #       retention_in_mb   = each.value.logs_file_size
  #     }
  #   }
  # }

  # WILL EXPAND LATER ~~~ TODO
  # app_settings = {}
  # auth_settings {}
  # auth_settings_v2 {}
  # key_vault_reference_identity_id = "value"
  # storage_account {
  #   // Dynamic
  # }
  # sticky_settings {}

  tags = each.value.tags
}
