resource "azurerm_linux_virtual_machine" "Terraform_Assignment" {
  # for_each                        = var.azure_vm
  /*
  Well i don't want to create 2 indivdual folders for LINUX VM and WINDOWS VM
  so thats why i'm using FOR with IF condition so that terraform can understand which map of object is for LINUX
  */
  for_each                        = { for f, k in var.azure_vm : f => k if k.os_type == "linux" }
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.Terraform_Assignment["arpit-vm-username"].value
  admin_password                  = data.azurerm_key_vault_secret.Terraform_Assignment["arpit-vm-password"].value
  disable_password_authentication = each.value.disable_password_authentication # false
  network_interface_ids           = [azurerm_network_interface.Terraform_Assignment[each.key].id]
  os_disk {
    caching              = each.value.caching              # "ReadWrite"
    storage_account_type = each.value.storage_account_type # "Standard_LRS"
  }
  source_image_reference {
    publisher = each.value.os_publisher
    offer     = each.value.os_offer
    sku       = each.value.os_sku
    version   = each.value.os_version
  }
}
