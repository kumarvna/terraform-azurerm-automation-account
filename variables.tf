variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "automation_account_name" {
    description = "Specifies the name of the Automation Account"
    default  ""
}

variable "sku_name" {
    description = "The SKU name of the account - only Basic is supported at this time"
    default = "Basic"
}
