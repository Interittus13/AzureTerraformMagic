variable "mssql" {
  type = map(object({
    use_existing_sql_server              = optional(bool, false)
    sql_server_name                      = string
    location                             = optional(string, "central india")
    resource_group_name                  = string
    version                              = optional(string, "12.0")
    admin_name                           = string
    admin_password                       = string
    connection_policy                    = optional(string, "Default") # Default, Proxy, Redirect
    encrypted_vault_key_id               = optional(string)
    minimum_tls_version                  = optional(string, "1.2") # 1.0, 1.1, 1.2, Disabled
    public_network_access_enabled        = optional(bool, true)
    outbound_network_restriction_enabled = optional(bool, false)
    domain_name                          = optional(string)
    login_username                       = optional(string)
    tags                                 = optional(map(string))
    db_name                              = string
    collation                            = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    license_type                         = optional(string, "LicenseIncluded")
    geo_backup_enabled                   = optional(bool, false)
    maintenance_configuration_name       = optional(string, "SQL_Default")
    ledger_enabled                       = optional(bool, false)
    max_size_gb                          = optional(number, 2)
    read_scale                           = optional(bool, true)
    db_sku                               = optional(string, "S1")
    transparent_data_encryption_enabled  = optional(bool, true)
    zone_redundant                       = optional(bool, true)
  }))
}
