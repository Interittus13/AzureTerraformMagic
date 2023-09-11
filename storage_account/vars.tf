variable "azure_storage_account" {
    type = map(object({
      storage_account_name = string
      resource_group_name = string
      location = optional(string, "central india")
      account_replication_type = optional(string, "LRS")
      account_tier = optional(string, "Standard")
      tags = optional(map(string))
    }))
}