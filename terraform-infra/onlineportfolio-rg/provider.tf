provider "azurerm" {
  features {
  }
  use_cli                         = true
  use_oidc                        = false
  resource_provider_registrations = "none"
  subscription_id                 = "bda5cbdb-4f67-41f5-8a38-2f2f1dc30363"
  environment                     = "public"
  use_msi                         = false
}
