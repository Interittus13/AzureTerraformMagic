module "locals" {
  source = "../../locals"
}

# SignalR
resource "azurerm_signalr_service" "bfx3_greenfield_signalR" {
  for_each            = var.signalr
  name                = each.value.signalr_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku {
    name     = each.value.sku
    capacity = each.value.capacity
  }
  cors {
    allowed_origins = each.value.allowed_origins
  }
  http_request_logs_enabled = each.value.http_request_logs_enabled
  connectivity_logs_enabled = each.value.connectivity_logs_enabled
  messaging_logs_enabled    = each.value.messaging_logs_enabled
  service_mode              = each.value.service_mode
  tags                      = merge(module.locals.defaultTags, var.tags)

  lifecycle {
    ignore_changes = [tags["createdOn"]]
  }
}
