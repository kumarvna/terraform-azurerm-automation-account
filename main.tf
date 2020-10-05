#----------------------------------------------------------
# Resource Group, Log Analytics Data Resources
#----------------------------------------------------------
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_automation_account" "aauto" {
  name                = var.automation_account_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = var.sku_name
  tags                = merge({ "ResourceName" = var.automation_account_name }, var.tags, )
}

