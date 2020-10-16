# Automation account Terraform module

Azure Automation is a new service in Azure that allows you to automate Azure management tasks and to orchestrate actions across external systems from right within Azure. It is built on PowerShell Workflow to take advantage of the language’s many features.

## Module Usage

```hcl
module "automation-account" {
  source  = "kumarvna/automation-account/azurerm"
  version = "1.0.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name     = "rg-shared-westeurope-01"
  automation_account_name = "default-automation-account"

  # (Optional) enabling Azure dignostics
  log_analytics_workspace_name = "loganalytics-we-sharedtest"
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
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

|Name | Description|
|---- | -----------|
`automation_account_id`|The Automation Account resource ID
`dsc_server_endpoint`|The DSC Server Endpoint associated with this Automation Account
`dsc_primary_access_key`|The Primary Access Key for the DSC Endpoint associated with this Automation Account
`dsc_secondary_access_key`|The Secondary Access Key for the DSC Endpoint associated with this Automation Account
