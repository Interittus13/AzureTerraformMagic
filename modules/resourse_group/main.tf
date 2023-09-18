resource "azurerm_resource_group" "Terraform_Assignment" {
    for_each = var.resource_group
    name = each.value.name
    location = each.value.location
    tags = each.value.tags
}