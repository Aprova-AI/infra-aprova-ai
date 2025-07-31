variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-aprova-ai-prod"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "prod"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "azureuser"
  
  validation {
    condition     = length(var.admin_username) >= 3 && length(var.admin_username) <= 20
    error_message = "Admin username must be between 3 and 20 characters."
  }
}

variable "ssh_public_key" {
  description = "SSH public key for VM authentication"
  type        = string
  sensitive   = true
  
  validation {
    condition     = can(regex("^ssh-rsa", var.ssh_public_key))
    error_message = "SSH public key must be a valid RSA key starting with 'ssh-rsa'."
  }
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH to the VMs"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Warning: This allows all IPs. Restrict in production!
  
  validation {
    condition = alltrue([
      for ip in var.allowed_ssh_ips : can(cidrhost(ip, 0))
    ])
    error_message = "All SSH IPs must be valid CIDR notation."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Prod"
    Project     = "aprova-ai"
    Service     = "infrastructure"
    ManagedBy   = "terraform"
    Owner       = "infrastructure-team"
  }
}

 