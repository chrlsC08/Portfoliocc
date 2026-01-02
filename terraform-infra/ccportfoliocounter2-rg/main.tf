resource "azurerm_resource_group" "backend-rg" {
  location = "canadaeast"
  name     = "ccportfoliocounter2"
}
resource "azurerm_application_insights" "app-insights" {
  application_type    = "web"
  location            = "canadaeast"
  name                = "ccportfoliocounter2"
  resource_group_name = "ccportfoliocounter2"
  sampling_percentage = 0
  depends_on = [
    azurerm_resource_group.backend-rg
  ]
}
resource "azurerm_storage_account" "func-storageaccount" {
  account_kind                    = "Storage"
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  default_to_oauth_authentication = true
  location                        = "canadaeast"
  min_tls_version                 = "TLS1_0"
  name                            = "ccportfoliocounter2"
  resource_group_name             = "ccportfoliocounter2"
  depends_on = [
    azurerm_resource_group.backend-rg
  ]
}
resource "azurerm_storage_container" "func-containerapppk" {
  name               = "app-package-ccportfoliocounter2-fd9de33"
  storage_account_id = azurerm_storage_account.func-storageaccount.id
  depends_on = [
    # One of azurerm_storage_account.func-storageaccount,azurerm_storage_account_queue_properties.func-storagequeue (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_container" "func-containerwebjobh" {
  name               = "azure-webjobs-hosts"
  storage_account_id = azurerm_storage_account.func-storageaccount.id
  depends_on = [
    # One of azurerm_storage_account.func-storageaccount,azurerm_storage_account_queue_properties.func-storagequeue (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_container" "func-containerwebjobsec" {
  name               = "azure-webjobs-secrets"
  storage_account_id = azurerm_storage_account.func-storageaccount.id
  depends_on = [
    # One of azurerm_storage_account.func-storageaccount,azurerm_storage_account_queue_properties.func-storagequeue (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_storage_account_queue_properties" "func-storagequeue" {
  storage_account_id = azurerm_storage_account.func-storageaccount.id
  hour_metrics {
    version = "1.0"
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
resource "azurerm_service_plan" "func-serviceplan" {
  location            = "canadaeast"
  name                = "FLEX-CCPortfolioCounter2-917f"
  os_type             = "Linux"
  resource_group_name = "ccportfoliocounter2"
  sku_name            = "FC1"
  depends_on = [
    azurerm_resource_group.backend-rg
  ]
}
resource "azurerm_linux_function_app" "func-app" {
  app_settings = {
    AzurePortfolioConnectionString       = var.cosmos_connection_string
    DEPLOYMENT_STORAGE_CONNECTION_STRING = azurerm_storage_account.func-storageaccount.primary_connection_string
  }
  builtin_logging_enabled     = false
  client_certificate_mode     = "Required"
  functions_extension_version = ""
  location                    = "canadaeast"
  name                        = "CCPortfolioCounter2"
  resource_group_name         = "ccportfoliocounter2"
  service_plan_id             = azurerm_service_plan.func-serviceplan.id
  storage_account_access_key  = var.cosmos_key
  storage_account_name        = "ccportfoliocounter2"
  tags = {
    "hidden-link: /app-insights-resource-id" = azurerm_application_insights.app-insights.id
  }
  site_config {
    application_insights_connection_string = azurerm_application_insights.app-insights.connection_string
    ftps_state                             = "FtpsOnly"
    ip_restriction_default_action          = "Allow"
    scm_ip_restriction_default_action      = "Allow"
    cors {
      allowed_origins = var.allowed_origins
    }
  }
}
resource "azurerm_function_app_function" "func-appfunction" {
  config_json = jsonencode({
    bindings = [{
      authLevel = "ANONYMOUS"
      direction = "IN"
      name      = "req"
      route     = "CCPortfolioCounter2"
      type      = "httpTrigger"
      }, {
      direction = "OUT"
      name      = "$return"
      type      = "http"
    }]
    entryPoint        = "CCPortfolioCounter2"
    functionDirectory = "/home/site/wwwroot"
    language          = "python"
    name              = "CCPortfolioCounter2"
    scriptFile        = "function_app.py"
  })
  function_app_id = azurerm_linux_function_app.func-app.id
  name            = "CCPortfolioCounter2"
}
resource "azurerm_app_service_custom_hostname_binding" "func-servicebinding" {
  app_service_name    = "CCPortfolioCounter2"
  hostname            = "ccportfoliocounter2.azurewebsites.net"
  resource_group_name = "ccportfoliocounter2"
  depends_on = [
    azurerm_linux_function_app.func-app
  ]
}
resource "azurerm_monitor_action_group" "monitor-actiongroup" {
  name                = "Application Insights Smart Detection"
  resource_group_name = "ccportfoliocounter2"
  short_name          = "SmartDetect"
  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }
  arm_role_receiver {
    name                    = "Monitoring Reader"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
  depends_on = [
    azurerm_resource_group.backend-rg
  ]
}
