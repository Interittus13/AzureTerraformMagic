module "azure_rg" {
  source         = "../../modules/resourse_group"
  resource_group = var.rg_module
}

module "azure_vnet" {
  source          = "../../modules/virtual_network"
  virtual_network = var.vnet_module
  depends_on      = [module.azure_rg]
}

module "azure_vnet_peering" {
  source       = "../../modules/vnet_peering"
  vnet_peering = var.peering_module
  depends_on   = [module.azure_vnet]
}
