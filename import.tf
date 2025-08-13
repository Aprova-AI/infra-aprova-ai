# Import existing resources that were created outside of Terraform state

# Import existing Public IP for monitoring VM
import {
  to = azurerm_public_ip.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-monitoring-prod"
}

# Import existing Network Security Group for monitoring VM
import {
  to = azurerm_network_security_group.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod"
}

# Import existing Network Interface for monitoring VM
import {
  to = azurerm_network_interface.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-monitoring-prod"
}

# Import existing Storage Account
import {
  to = azurerm_storage_account.logs_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Storage/storageAccounts/logsmonitoringaprovaai"
}

# Import existing NSG rules for monitoring port 9723
import {
  to = azurerm_network_security_rule.micro_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod/securityRules/Monitoring"
}

import {
  to = azurerm_network_security_rule.large_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/Monitoring"
}

import {
  to = azurerm_network_security_rule.xlarge_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/Monitoring"
}

import {
  to = azurerm_network_security_rule.ansible_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-ansible-prod/securityRules/Monitoring"
}

# Import existing NSG rules for monitoring VM
import {
  to = azurerm_network_security_rule.monitoring_ssh
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod/securityRules/SSH"
}

import {
  to = azurerm_network_security_rule.monitoring_http
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod/securityRules/HTTP"
}

import {
  to = azurerm_network_security_rule.monitoring_https
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod/securityRules/HTTPS"
}
