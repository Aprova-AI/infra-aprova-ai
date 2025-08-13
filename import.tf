# Import existing monitoring VM that was created outside of Terraform
import {
  to = azurerm_linux_virtual_machine.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Compute/virtualMachines/vm-aprova-ai-monitoring"
}

# Import existing Public IP for monitoring VM
import {
  to = azurerm_public_ip.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-monitoring-prod"
}

# Import existing Network Interface for monitoring VM
import {
  to = azurerm_network_interface.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-monitoring-prod"
}

# Import existing NSG for monitoring VM
import {
  to = azurerm_network_security_group.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod"
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

# Import existing Network Interface Security Group Association for monitoring VM
import {
  to = azurerm_network_interface_security_group_association.vm_monitoring
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-monitoring-prod|/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-monitoring-prod"
}
