module "locals" {
  source = "../../../modules/locals"
}

module "resource_group" {
  source    = "../../../modules/management/resource_group"
  rg        = var.rg
  tags      = merge(module.locals.defaultTags, var.tags)
}
