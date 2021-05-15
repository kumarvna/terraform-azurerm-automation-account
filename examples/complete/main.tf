module "automation-account" {
  source  = "kumarvna/automation-account/azurerm"
  version = "1.1.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name     = "rg-shared-westeurope-01"
  automation_account_name = "default-automation-account"

  # (Optional) enabling Azure dignostics
  log_analytics_workspace_name = "loganalytics-we-sharedtest2"
  hub_storage_account_name     = "stdiagfortesting"

  # Adding TAG's to your Azure resources (Required)
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
