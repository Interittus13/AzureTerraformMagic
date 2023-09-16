mssql = {
  "db01" = {
    use_existing_sql_server = true
    sql_server_name         = "sqlserveradmin"
    admin_name              = "sqladmin"
    admin_password          = "password"
    resource_group_name     = "ArpitRG"
    db_name                 = "sqldb"
    read_scale              = false
    zone_redundant          = false
  }
}
