resource "azurerm_service_plan" "Terraform_Assignment" {
  for_each                     = { for f, k in var.app_service : f => k if k.deploy_web_app && !k.use_existing_service_plan }
  name                         = each.value.service_plan_name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  os_type                      = each.value.os_type
  sku_name                     = each.value.app_service_sku
  maximum_elastic_worker_count = each.value.maximum_elastic_worker_count
  worker_count                 = each.value.worker_count
  per_site_scaling_enabled     = each.value.per_site_scaling_enabled
  zone_balancing_enabled       = each.value.zone_balancing_enabled
  tags                         = each.value.tags
}

data "azurerm_service_plan" "Terraform_Assignment" {
  for_each = { for f, k in var.app_service : f => k if k.use_existing_service_plan }
  name                = each.value.service_plan_name
  resource_group_name = each.value.resource_group_name
}
