#--------------------------------------
# Resource Group and other resoruces
#--------------------------------------
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "logws" {
  count               = var.log_analytics_workspace_name != null ? 1 : 0
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "storeacc" {
  count               = var.hub_storage_account_name != null ? 1 : 0
  name                = var.hub_storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

#---------------------------------
# Azure Automation Account
#---------------------------------
resource "azurerm_automation_account" "aauto" {
  name                = var.automation_account_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = var.sku_name
  tags                = merge({ "ResourceName" = format("%s", var.automation_account_name) }, var.tags, )
}


#---------------------------------------------------------------
# azurerm monitoring diagnostics - automation account
#---------------------------------------------------------------
resource "azurerm_monitor_diagnostic_setting" "acc" {
  count                      = var.log_analytics_workspace_name != null && var.hub_storage_account_name != null ? 1 : 0
  name                       = lower("aacc-${var.automation_account_name}-diag")
  target_resource_id         = azurerm_automation_account.aauto.id
  storage_account_id         = data.azurerm_storage_account.storeacc.0.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logws.0.id

  dynamic "log" {
    for_each = var.auto_diag_logs
    content {

      category = log.value
      enabled  = true

      retention_policy {
        enabled = false
      }
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
