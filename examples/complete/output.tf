output "automation_account_id" {
  description = "The Automation Account resource ID"
  value       = module.automation-account.automation_account_id
}

output "dsc_server_endpoint" {
  description = "The DSC Server Endpoint associated with this Automation Account"
  value       = module.automation-account.dsc_server_endpoint
}

output "dsc_primary_access_key" {
  description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account"
  value       = module.automation-account.dsc_primary_access_key
}

output "dsc_secondary_access_key" {
  description = "The Secondary Access Key for the DSC Endpoint associated with this Automation Account"
  value       = module.automation-account.dsc_secondary_access_key
}
