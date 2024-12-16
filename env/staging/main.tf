module "locals" {
  source = "../../modules/locals"
}

module "resource_group" {
  source = "../../modules/management/resource_group"
  rg     = var.rg
  tags   = var.tags
}

module "log_analytics_workspace" {
  source = "../../modules/management/log_analytics_ws"
  log_ws = var.log_ws
  tags   = var.tags

  depends_on = [module.resource_group]
}

module "application_insights" {
  source = "../../modules/management/application_insights"
  appins = var.appins
  tags   = var.tags

  depends_on = [module.log_analytics_workspace]
}

# modules/networking
module "virtual_network" {
  source = "../../modules/networking/virtual_network"
  vnet   = var.vnet
  tags   = var.tags

  depends_on = [ module.resource_group ]
}

module "subnet" {
  source = "../../modules/networking/subnet"
  subnet = var.subnet

  depends_on = [ module.virtual_network ]
}
