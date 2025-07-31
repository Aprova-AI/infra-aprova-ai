#!/bin/bash

# Script para importar todos os recursos existentes no Azure
# Execute este script no GitHub Actions antes do terraform apply

echo "Importing existing Azure resources to Terraform state..."

# Resource Group (já foi importado)
# terraform import azurerm_resource_group.main /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2

# Virtual Network
terraform import azurerm_virtual_network.main /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/virtualNetworks/vnet-prod

# Public IPs
terraform import azurerm_public_ip.vm_large /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-large-prod
terraform import azurerm_public_ip.vm_xlarge /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-xlarge-prod
terraform import azurerm_public_ip.vm_micro /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-micro-prod
terraform import azurerm_public_ip.vm_ansible /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/publicIPAddresses/pip-vm-ansible-prod

# Network Security Groups
terraform import azurerm_network_security_group.vm_micro /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod
terraform import azurerm_network_security_group.vm_large /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod
terraform import azurerm_network_security_group.vm_xlarge /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod
terraform import azurerm_network_security_group.vm_ansible /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-ansible-prod

# Log Analytics Workspace
terraform import azurerm_log_analytics_workspace.main /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.OperationalInsights/workspaces/law-prod

echo "All resources imported successfully!" 