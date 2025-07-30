variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-infracost-test-01"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
} 