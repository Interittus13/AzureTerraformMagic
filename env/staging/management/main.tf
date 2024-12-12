module "locals" {
  source = "../../../modules/locals"
}

module "resource_group" {
  source = "../../../modules/management/resource_group"
  rg     = var.rg
  tags   = merge(module.locals.defaultTags, var.tags)
}

module "log_analytics_workspace" {
  source = "../../../modules/management/log_analytics_ws"
  log_ws = var.log_ws
  tags   = merge(module.locals.defaultTags, var.tags)

  depends_on = [module.resource_group]
}

module "application_insights" {
  source = "../../../modules/management/application_insights"
  appins = var.appins
  tags   = merge(module.locals.defaultTags, var.tags)

  depends_on = [module.log_analytics_workspace]
}
