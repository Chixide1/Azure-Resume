resource "azurerm_service_plan" "sp" {
  name                = "ck-azure-functions-cloud-resume-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "function" {
  name                       = "chikfuncs"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id            = azurerm_service_plan.sp.id
  storage_account_name       = azurerm_storage_account.storage_acct.name
  storage_account_access_key = azurerm_storage_account.storage_acct.primary_access_key
  app_settings = {
    conn_str = element(azurerm_cosmosdb_account.dbaccount.connection_strings, 4)
    SCM_DO_BUILD_DURING_DEPLOYMENT = true
  }
  site_config {
    application_stack {
      python_version = "3.11"
    }

    cors {
      allowed_origins = ["https://ckazureresumesa.z33.web.core.windows.net","https://ck-cloud-resume-endpoint.azureedge.net"]
    }
  }
}