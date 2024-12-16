# WAF Policy for AGW
resource "azurerm_web_application_firewall_policy" "bfx3_greenfield_agw_waf_policy" {
  for_each            = { for f, k in var.agw : f => k if k.sku_tier == "WAF_v2" }
  name                = each.value.firewall_policy_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  policy_settings {
    enabled                                   = true
    file_upload_limit_in_mb                   = 750
    js_challenge_cookie_expiration_in_minutes = 5
    max_request_body_size_in_kb               = 128
    mode                                      = "Detection"
    request_body_check                        = true
    request_body_enforcement                  = false
    request_body_inspect_limit_in_kb          = 0
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
    }
    managed_rule_set {
      type    = "Microsoft_BotManagerRuleSet"
      version = "1.0"
    }
  }

  lifecycle {
    ignore_changes = [policy_settings[0].js_challenge_cookie_expiration_in_minutes, tags]
  }
}

# Application Gateway
resource "azurerm_application_gateway" "bfx3_greenfield_agw" {
  for_each                          = var.agw
  name                              = each.value.agw_name
  resource_group_name               = each.value.rg_name
  location                          = each.value.location
  zones                             = each.value.zones
  force_firewall_policy_association = each.value.force_firewall_policy
  firewall_policy_id                = each.value.sku_tier == "WAF_v2" ? azurerm_web_application_firewall_policy.bfx3_greenfield_agw_waf_policy[each.key].id : null

  sku {
    name = each.value.sku
    tier = each.value.sku_tier
  }

  gateway_ip_configuration {
    name      = each.value.ipc_name
    subnet_id = data.azurerm_subnet.bfx3_greenfield_agw_snet_data[each.key].id
  }

  frontend_ip_configuration {
    name                 = each.value.feip_config_name # "${each.value.vnet_name}-feip"
    public_ip_address_id = data.azurerm_public_ip.bfx3_greenfield_agw_pip_data[each.key].id
  }

  dynamic "frontend_port" {
    for_each = each.value.frontend_ports
    content {
      name = frontend_port.value.fe_port_name
      port = frontend_port.value.fe_port
    }
  }

  dynamic "backend_address_pool" {
    for_each = each.value.be_address_pools
    content {
      name = backend_address_pool.value.be_address_pool_name
    }
  }

  dynamic "backend_http_settings" {
    for_each = each.value.be_http_sttngs
    content {
      name                  = backend_http_settings.value.http_setting_name
      cookie_based_affinity = backend_http_settings.value.be_cookie_based_affinity
      path                  = backend_http_settings.value.be_path
      port                  = backend_http_settings.value.be_port
      protocol              = backend_http_settings.value.be_protocol
      request_timeout       = backend_http_settings.value.be_request_timeout
      # probe_name                     = backend_http_settings.value.be_probe_name
      # trusted_root_certificate_names = backend_http_settings.value.be_trusted_root_certificate_names
    }
  }

  dynamic "http_listener" {
    for_each = each.value.http_listeners
    content {
      name                           = http_listener.value.listener_name
      frontend_ip_configuration_name = each.value.feip_config_name
      frontend_port_name             = http_listener.value.fe_port_name
      protocol                       = http_listener.value.http_protocol
      # host_names                     = http_listener.value.host_names
      # ssl_certificate_name           = http_listener.value.ssl_certificate_name
    }
  }

  dynamic "request_routing_rule" {
    for_each = each.value.rqst_routing_rules
    content {
      name                       = request_routing_rule.value.rrr_name
      rule_type                  = request_routing_rule.value.rrr_rule_type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      url_path_map_name          = request_routing_rule.value.url_path_map_name
      priority                   = request_routing_rule.value.rrr_priority
    }
  }

  autoscale_configuration {
    min_capacity = each.value.autoscale_min_capacity
    max_capacity = each.value.autoscale_max_capacity
  }

  identity {
    type         = each.value.identity_type
    identity_ids = [data.azurerm_user_assigned_identity.bfx3_greenfield_uai_data[each.key].id]
  }

  dynamic "url_path_map" {
    for_each = each.value.url_path_maps
    content {
      name                               = url_path_map.value.upm_name
      default_backend_address_pool_name  = url_path_map.value.upm_ba_pool_name
      default_backend_http_settings_name = url_path_map.value.upm_ba_http_name
      dynamic "path_rule" {
        for_each = url_path_map.value.path_rules
        content {
          name                       = path_rule.value.rule_name
          paths                      = path_rule.value.paths
          backend_address_pool_name  = path_rule.value.ba_address_pool_name
          backend_http_settings_name = path_rule.value.ba_http_setting_name
        }
      }
    }
  }

  enable_http2 = each.value.enable_http2
  tags         = merge(var.tags, each.value.tags)

  lifecycle {
    ignore_changes = [backend_address_pool, backend_http_settings, http_listener, request_routing_rule, probe, redirect_configuration, ssl_certificate, url_path_map, url_path_map]
  }
}
