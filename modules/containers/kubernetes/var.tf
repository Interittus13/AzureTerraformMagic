variable "tags" {
  type = map(string)
}

# Kubernetes Cluster (AKS)
variable "aks" {
  type = map(object({
    rg_name                          = string
    location                         = optional(string, "CentralUS")
    networking_rg_name               = string
    vnet_name                        = string
    subnet_name                      = string
    aks_name                         = string
    agw_name                         = string
    ws_name                          = string
    dns_prefix                       = string
    automatic_channel_upgrade        = optional(string, "stable")
    private_cluster_enabled          = bool
    sku_tier                         = optional(string, "Free")
    support_plan                     = optional(string, "KubernetesOfficial")
    identity                         = optional(string, "SystemAssigned")
    default_np_name                  = optional(string, "akspool")
    default_np_node_count            = optional(number, 3)
    default_np_vm_size               = optional(string, "Standard_D2as_v4")
    default_np_type                  = optional(string, "VirtualMachineScaleSets")
    default_np_enable_auto_scaling   = optional(bool, true)
    default_np_max_count             = optional(number, 2)
    default_np_min_count             = optional(number, 1)
    default_np_max_pods              = optional(number, 30)
    default_np_kubelet_disk_type     = optional(string)
    default_np_os_disk_type          = optional(string, "managed")
    kv_secret_rotation_enabled       = bool
    dom                              = number
    dow                              = string
    duration                         = number
    frequency                        = string
    interval                         = number
    start_date                       = string
    start_time                       = string
    utc_offset                       = string
    np_load_balancer_sku             = string
    np_network_plugin                = string
    np_network_policy                = string
    np_dns_service_ip                = string
    np_service_cidr                  = string
    rbac_enabled                     = bool
    azure_policy_enabled             = bool
    kubernetes_version               = string
    ca_trust_certificates_base64     = list(string)
    http_application_routing_enabled = bool
  }))
}
