resource "azurerm_windows_virtual_machine" "Terraform_Assignment" {
#   for_each              = var.azure_vm
  for_each              = { for f, k in var.azure_vm : f => k if k.os_type == "windows" }
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  name                  = each.value.vm_name
  network_interface_ids = [azurerm_network_interface.Terraform_Assignment[each.key].id]
  admin_username        = data.azurerm_key_vault_secret.Terraform_Assignment["arpit-vm-username"].value
  admin_password        = data.azurerm_key_vault_secret.Terraform_Assignment["arpit-vm-password"].value
  size                  = each.value.size
  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }
  source_image_reference {
    publisher = each.value.os_publisher
    offer     = each.value.os_offer
    sku       = each.value.os_sku
    version   = each.value.os_version
  }

}