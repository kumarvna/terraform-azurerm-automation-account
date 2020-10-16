variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "The name of log analytics workspace name"
  default     = null
}

variable "hub_storage_account_name" {
  description = "The name of the hub storage account to store logs"
  default     = null
}

variable "automation_account_name" {
  description = "Specifies the name of the Automation Account"
  default     = ""
}

variable "sku_name" {
  description = "The SKU name of the account - only Basic is supported at this time"
  default     = "Basic"
}

variable "auto_diag_logs" {
  description = "A list of categories of platform logs and/or metrics that you want to collect from a resource"
  default     = ["JobLogs", "JobStreams", "DscNodeStatus"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
