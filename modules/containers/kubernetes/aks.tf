resource "azurerm_kubernetes_cluster" "kubernetes" {
  for_each                            = var.aks
  name                                = each.value.aks_name
  location                            = each.value.location
  resource_group_name                 = each.value.rg_name
  dns_prefix                          = each.value.dns_prefix
  automatic_upgrade_channel           = each.value.automatic_channel_upgrade
  private_cluster_enabled             = each.value.private_cluster_enabled
  private_cluster_public_fqdn_enabled = each.value.private_cluster_public_fqdn_enabled
  sku_tier                            = each.value.sku_tier
  support_plan                        = each.value.support_plan

  identity {
    type = each.value.identity
  }

  default_node_pool {
    name                 = each.value.default_np_name
    node_count           = each.value.default_np_node_count
    vm_size              = each.value.default_np_vm_size
    vnet_subnet_id       = data.azurerm_subnet.bfx3_greenfield_aks_subnet[each.key].id
    type                 = each.value.default_np_type
    auto_scaling_enabled = each.value.default_np_enable_auto_scaling
    max_count            = each.value.default_np_max_count
    min_count            = each.value.default_np_min_count
    max_pods             = each.value.default_np_max_pods
    kubelet_disk_type    = each.value.default_np_kubelet_disk_type
    os_disk_type         = each.value.default_np_os_disk_type
  }

  maintenance_window_node_os {
    day_of_month = each.value.maintenance_dom
    day_of_week  = each.value.maintenance_dow
    duration     = each.value.maintenance_duration
    frequency    = each.value.maintenance_frequency
    interval     = each.value.maintenance_interval
    start_date   = each.value.maintenance_start_date
    start_time   = each.value.maintenance_start_time
    utc_offset   = each.value.maintenance_utc_offset
  }

  network_profile {
    load_balancer_sku = each.value.np_load_balancer_sku
    network_plugin    = each.value.np_network_plugin
    network_policy    = each.value.np_network_policy
    dns_service_ip    = each.value.np_dns_service_ip
    ip_versions       = each.value.np_ip_versions
    pod_cidrs         = each.value.np_pod_cidrs
    service_cidr      = each.value.np_service_cidr
    service_cidrs     = each.value.np_service_cidrs
  }

  role_based_access_control_enabled = each.value.rbac_enabled

  # ingress_application_gateway {
  #   gateway_id = data.azurerm_application_gateway.bfx3_greenfield_aks_gateway[each.key].id
  # }

  azure_policy_enabled             = each.value.azure_policy_enabled
  kubernetes_version               = each.value.kubernetes_version
  http_application_routing_enabled = each.value.http_application_routing_enabled

  tags = merge(var.tags, each.value.tags)

  # lifecycle {
  #   ignore_changes = [oms_agent[0].log_analytics_workspace_id]
  # }
}

