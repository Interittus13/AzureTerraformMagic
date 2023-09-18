output "vm_pip" {
  value = [
    for vm in azurerm_public_ip.Terraform_Assignment : {
      vm_name = vm.name
      vm_pip = vm.ip_address
    }
  ]
}

# output "vm_secrets" {
#   value = tolist([for secret in data.azurerm_key_vault_secret.Terraform_Assignment : secret.name])
# }