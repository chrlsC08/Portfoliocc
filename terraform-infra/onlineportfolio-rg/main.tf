resource "azurerm_resource_group" "frontend-rg" {
  location = "eastus"
  name     = "onlineportfolio-rg"
  tags = {
    environment = "dev"
  }
}
resource "azurerm_cdn_frontdoor_profile" "frontdoor-profile" {
  name                     = "onlineportfoliocc"
  resource_group_name      = "onlineportfolio-rg"
  response_timeout_seconds = 60
  sku_name                 = "Standard_AzureFrontDoor"
  depends_on = [
    azurerm_resource_group.frontend-rg
  ]
}
resource "azurerm_cdn_frontdoor_endpoint" "frontdoor-endpoint" {
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor-profile.id
  name                     = "onlineportfoliocc"
}
resource "azurerm_cdn_frontdoor_route" "frontdoor-route" {
  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.frontdoor-customdomain.id]
  cdn_frontdoor_endpoint_id       = azurerm_cdn_frontdoor_endpoint.frontdoor-endpoint.id
  cdn_frontdoor_origin_group_id   = azurerm_cdn_frontdoor_origin_group.frontdoor-origingroup.id
  name                            = "default-route"
  patterns_to_match               = ["/*"]
  supported_protocols             = ["Http", "Https"]
  cdn_frontdoor_origin_ids = [azurerm_cdn_frontdoor_origin.frontdoor-origin.id]
}
resource "azurerm_cdn_frontdoor_custom_domain" "frontdoor-customdomain" {
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor-profile.id
  host_name                = "www.portfoliocc.online"
  name                     = "www-portfoliocc-online-e662"
  tls {
  }
}
resource "azurerm_cdn_frontdoor_origin_group" "frontdoor-origingroup" {
  cdn_frontdoor_profile_id                                  = azurerm_cdn_frontdoor_profile.frontdoor-profile.id
  name                                                      = "default-origin-group-45aaa0d5"
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = 0
  session_affinity_enabled                                  = false
  health_probe {
    interval_in_seconds = 100
    protocol            = "Http"
  }
  load_balancing {
  }
}
resource "azurerm_cdn_frontdoor_origin" "frontdoor-origin" {
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.frontdoor-origingroup.id
  certificate_name_check_enabled = true
  host_name                      = azurerm_storage_account.storage-account.primary_web_host
  name                           = "default-origin"
  origin_host_header             = azurerm_storage_account.storage-account.primary_web_host
  weight                         = 1000
}
resource "azurerm_cosmosdb_account" "cosmosdb-account" {
  location            = "eastus"
  name                = "azurerportfolio"
  offer_type          = "Standard"
  resource_group_name = "onlineportfolio-rg"
  tags = {
    defaultExperience       = "Core (SQL)"
    hidden-cosmos-mmspecial = ""
  }
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    failover_priority = 0
    location          = "eastus"
  }
  depends_on = [
    azurerm_resource_group.frontend-rg
  ]
}
resource "azurerm_cosmosdb_sql_database" "cosmos-sqldb" {
  account_name        = "azurerportfolio"
  name                = "AzurePortfolio"
  resource_group_name = "onlineportfolio-rg"
  depends_on = [
    azurerm_cosmosdb_account.cosmosdb-account
  ]
}
resource "azurerm_cosmosdb_sql_container" "cosmos-sqlcontainer" {
  account_name          = "azurerportfolio"
  database_name         = "AzurePortfolio"
  name                  = "Counter"
  partition_key_paths   = ["/id"]
  partition_key_version = 2
  resource_group_name   = "onlineportfolio-rg"
  depends_on = [
    azurerm_cosmosdb_sql_database.cosmos-sqldb
  ]
}
resource "azurerm_cosmosdb_sql_role_definition" "cosmos-role-dreader" {
  account_name        = "azurerportfolio"
  assignable_scopes   = [azurerm_cosmosdb_account.cosmosdb-account.id]
  name                = "Cosmos DB Built-in Data Reader"
  resource_group_name = "onlineportfolio-rg"
  type                = "BuiltInRole"
  permissions {
    data_actions = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed"]
  }
}
resource "azurerm_cosmosdb_sql_role_definition" "cosmos-role-dcontributor" {
  account_name        = "azurerportfolio"
  assignable_scopes   = [azurerm_cosmosdb_account.cosmosdb-account.id]
  name                = "Cosmos DB Built-in Data Contributor"
  resource_group_name = "onlineportfolio-rg"
  type                = "BuiltInRole"
  permissions {
    data_actions = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*"]
  }
}
resource "azurerm_storage_account" "storage-account" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  cross_tenant_replication_enabled = true
  location                         = "eastus"
  name                             = "onlineportfolioccstact"
  resource_group_name              = "onlineportfolio-rg"
  depends_on = [
    azurerm_resource_group.frontend-rg
  ]
}
resource "azurerm_storage_container" "storage-container-web" {
  name               = "$web"
  storage_account_id = azurerm_storage_account.storage-account.id
  depends_on = [
    # One of azurerm_storage_account.storage-account,azurerm_storage_account_queue_properties.storage-accountqueue (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_account_queue_properties" "storage-accountqueue" {
  storage_account_id = azurerm_storage_account.storage-account.id
  hour_metrics {
    include_apis          = true
    retention_policy_days = 7
    version               = "1.0"
  }
  logging {
    delete  = false
    read    = false
    version = "1.0"
    write   = false
  }
  minute_metrics {
    version = "1.0"
  }
}
