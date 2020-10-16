output "automation_account_id" {
  description = "The Automation Account resource ID"
  value       = azurerm_automation_account.aauto.id
}

output "dsc_server_endpoint" {
  description = "The DSC Server Endpoint associated with this Automation Account"
  value       = azurerm_automation_account.aauto.dsc_server_endpoint
}

output "dsc_primary_access_key" {
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account"
  value       = azurerm_automation_account.aauto.dsc_primary_access_key
}

output "dsc_secondary_access_key" {
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account"
  value       = azurerm_automation_account.aauto.dsc_secondary_access_key
}
