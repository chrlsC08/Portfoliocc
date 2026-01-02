# Resource Group
moved {
  from = azurerm_resource_group.res-0
  to   = azurerm_resource_group.frontend-rg
}

# Front Door Stack
moved {
  from = azurerm_cdn_frontdoor_profile.res-1
  to   = azurerm_cdn_frontdoor_profile.frontdoor-profile
}

moved {
  from = azurerm_cdn_frontdoor_endpoint.res-2
  to   = azurerm_cdn_frontdoor_endpoint.frontdoor-endpoint
}

moved {
  from = azurerm_cdn_frontdoor_route.res-3
  to   = azurerm_cdn_frontdoor_route.frontdoor-route
}

moved {
  from = azurerm_cdn_frontdoor_custom_domain.res-4
  to   = azurerm_cdn_frontdoor_custom_domain.frontdoor-customdomain
}

moved {
  from = azurerm_cdn_frontdoor_origin_group.res-5
  to   = azurerm_cdn_frontdoor_origin_group.frontdoor-origingroup
}

moved {
  from = azurerm_cdn_frontdoor_origin.res-6
  to   = azurerm_cdn_frontdoor_origin.frontdoor-origin
}

# Cosmos DB Stack
moved {
  from = azurerm_cosmosdb_account.res-8
  to   = azurerm_cosmosdb_account.cosmosdb-account
}

moved {
  from = azurerm_cosmosdb_sql_database.res-9
  to   = azurerm_cosmosdb_sql_database.cosmos-sqldb
}

moved {
  from = azurerm_cosmosdb_sql_container.res-10
  to   = azurerm_cosmosdb_sql_container.cosmos-sqlcontainer
}

moved {
  from = azurerm_cosmosdb_sql_role_definition.res-11
  to   = azurerm_cosmosdb_sql_role_definition.cosmos-role-dreader
}

moved {
  from = azurerm_cosmosdb_sql_role_definition.res-12
  to   = azurerm_cosmosdb_sql_role_definition.cosmos-role-dcontributor
}

# Storage Stack
moved {
  from = azurerm_storage_account.res-15
  to   = azurerm_storage_account.storage-account
}

moved {
  from = azurerm_storage_container.res-17
  to   = azurerm_storage_container.storage-container-web
}

moved {
  from = azurerm_storage_account_queue_properties.res-19
  to   = azurerm_storage_account_queue_properties.storage-accountqueue
}