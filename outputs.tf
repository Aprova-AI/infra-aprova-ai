# Resource Group
output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = azurerm_resource_group.main.location
}

# Virtual Network
output "virtual_network_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "ID of the VM subnet"
  value       = azurerm_subnet.vm_subnet.id
}

# Public IPs
output "vm_large_public_ip" {
  description = "Public IP address of the large VM"
  value       = azurerm_public_ip.vm_large.ip_address
}

output "vm_xlarge_public_ip" {
  description = "Public IP address of the xlarge VM"
  value       = azurerm_public_ip.vm_xlarge.ip_address
}

output "vm_micro_public_ip" {
  description = "Public IP address of the micro VM"
  value       = azurerm_public_ip.vm_micro.ip_address
}

output "vm_ansible_public_ip" {
  description = "Public IP address of the Ansible VM"
  value       = azurerm_public_ip.vm_ansible.ip_address
}

output "vm_monitoring_public_ip" {
  description = "Public IP address of the Monitoring VM"
  value       = azurerm_public_ip.vm_monitoring.ip_address
}

# VMs
output "vm_large_id" {
  description = "ID of the large VM"
  value       = azurerm_linux_virtual_machine.vm_large.id
}

output "vm_xlarge_id" {
  description = "ID of the xlarge VM"
  value       = azurerm_linux_virtual_machine.vm_xlarge.id
}

output "vm_micro_id" {
  description = "ID of the micro VM"
  value       = azurerm_linux_virtual_machine.vm_micro.id
}

output "vm_ansible_id" {
  description = "ID of the Ansible VM"
  value       = azurerm_linux_virtual_machine.vm_ansible.id
}

output "vm_monitoring_id" {
  description = "ID of the Monitoring VM"
  value       = azurerm_linux_virtual_machine.vm_monitoring.id
}

output "vm_large_private_ip" {
  description = "Private IP address of the large VM"
  value       = azurerm_network_interface.vm_large.private_ip_address
}

output "vm_xlarge_private_ip" {
  description = "Private IP address of the xlarge VM"
  value       = azurerm_network_interface.vm_xlarge.private_ip_address
}

output "vm_micro_private_ip" {
  description = "Private IP address of the micro VM"
  value       = azurerm_network_interface.vm_micro.private_ip_address
}

output "vm_ansible_private_ip" {
  description = "Private IP address of the Ansible VM"
  value       = azurerm_network_interface.vm_ansible.private_ip_address
}

output "vm_monitoring_private_ip" {
  description = "Private IP address of the Monitoring VM"
  value       = azurerm_network_interface.vm_monitoring.private_ip_address
}

# SSH Connection Commands
output "ssh_commands" {
  description = "SSH commands to connect to the VMs"
  value = {
    vm_large  = "ssh ${var.admin_username}@${azurerm_public_ip.vm_large.ip_address}"
    vm_xlarge = "ssh ${var.admin_username}@${azurerm_public_ip.vm_xlarge.ip_address}"
    vm_micro  = "ssh ${var.admin_username}@${azurerm_public_ip.vm_micro.ip_address}"
    vm_ansible = "ssh ${var.admin_username}@${azurerm_public_ip.vm_ansible.ip_address}"
    vm_monitoring = "ssh ${var.admin_username}@${azurerm_public_ip.vm_monitoring.ip_address}"
  }
}



# Storage Account
output "storage_account_name" {
  description = "Name of the logs and monitoring storage account"
  value       = azurerm_storage_account.logs_monitoring.name
}

output "storage_account_primary_access_key" {
  description = "Primary access key for the storage account"
  value       = azurerm_storage_account.logs_monitoring.primary_access_key
  sensitive   = true
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint for the storage account"
  value       = azurerm_storage_account.logs_monitoring.primary_blob_endpoint
}

# Cost Estimation (for Infracost)
output "estimated_monthly_cost" {
  description = "Estimated monthly cost for the infrastructure"
  value = {
    note = "Run 'infracost breakdown --path .' to get detailed cost estimation"
    vm_large_monthly  = "~$146/month (Standard_B4ms)"
    vm_xlarge_monthly = "~$146/month (Standard_B4ms)"
    vm_micro_monthly  = "~$18/month (Standard_B1s)"
    vm_ansible_monthly = "~$18/month (Standard_B1s)"
    vm_monitoring_monthly = "~$146/month (Standard_D4als_v6)"
    storage_monthly   = "~$20-50/month (depending on usage)"
    total_estimated   = "~$494-524/month (VMs + Storage, excluding networking)"
  }
} 