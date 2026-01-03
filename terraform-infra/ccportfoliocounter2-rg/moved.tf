# Resource Group
moved {
  from = azurerm_resource_group.res-0
  to   = azurerm_resource_group.backend-rg
}

# Monitoring & Insights
moved {
  from = azurerm_application_insights.res-1
  to   = azurerm_application_insights.app-insights
}

moved {
  from = azurerm_monitor_action_group.res-17
  to   = azurerm_monitor_action_group.monitor-actiongroup
}

# Storage Account & Containers/Queues
moved {
  from = azurerm_storage_account.res-2
  to   = azurerm_storage_account.func-storageaccount
}

moved {
  from = azurerm_storage_container.res-4
  to   = azurerm_storage_container.func-containerapppk
}

moved {
  from = azurerm_storage_container.res-5
  to   = azurerm_storage_container.func-containerwebjobh
}

moved {
  from = azurerm_storage_container.res-6
  to   = azurerm_storage_container.func-containerwebjobsec
}

moved {
  from = azurerm_storage_account_queue_properties.res-8
  to   = azurerm_storage_account_queue_properties.func-storagequeue
}

# Compute (App Service Plan & Function App)
moved {
  from = azurerm_service_plan.res-10
  to   = azurerm_service_plan.func-serviceplan
}

# Note: If your main.tf uses azurerm_function_app (legacy), change the type below
moved {
  from = azurerm_linux_function_app.res-11
  to   = azurerm_linux_function_app.func-app
}

moved {
  from = azurerm_function_app_function.res-15
  to   = azurerm_function_app_function.func-appfunction
}

moved {
  from = azurerm_app_service_custom_hostname_binding.res-16
  to   = azurerm_app_service_custom_hostname_binding.func-servicebinding
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