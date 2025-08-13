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
