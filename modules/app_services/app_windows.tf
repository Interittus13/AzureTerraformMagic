resource "azurerm_windows_web_app" "Terraform_Assignment" {
  for_each = { for f, k in var.app_service : f => k if k.deploy_web_app && k.os_type == "Windows" }

  location            = each.value.location
  name                = each.value.app_name
  resource_group_name = each.value.resource_group_name
  service_plan_id     = each.value.use_existing_service_plan ? data.azurerm_service_plan.Terraform_Assignment[each.key].id : azurerm_service_plan.Terraform_Assignment[each.key].id
  site_config {
    always_on = each.value.always_on

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
        action_type = each.value.action_type
        custom_action {
          executable = each.value.executable
          parameters = each.value.parameters
        }
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

  tags = each.value.tags
}
