resource "azurerm_storage_account" "ArpitStorage" {
    for_each = var.azure_storage_account
    name = each.value.storage_account_name # "mystorageaccountarpit"
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_replication_type = each.value.account_replication_type
    account_tier = each.value.account_tier

    tags = each.value.tags
    
}

resource "azurerm_storage_container" "ArpitStorage" {
    name = "mycontainer"
    storage_account_name = var.storageAccountName # "mystorageaccountarpit"
    container_access_type = "private"
    
}

# resource "azurerm_storage_blob" "ArpitStorage" {
#     name = "myblob"
#     storage_account_name = var.storageAccountName # "mystorageaccountarpit"
#     storage_container_name = "mycontainer"
#     type = "Block"
    
# }