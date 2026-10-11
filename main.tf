data "oci_database_tools_database_tools_mcp_servers" "database_tools_database_tools_mcp_servers_lookup" {
  for_each = var.database_tools_database_tools_mcp_servers_lookup

  compartment_id               = each.value.compartment_id
  database_tools_connection_id = each.value.database_tools_connection_id
  display_name                 = each.value.display_name
  related_resource_identifier  = each.value.related_resource_identifier
  state                        = each.value.state
  type                         = each.value.type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

