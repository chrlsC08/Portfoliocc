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

