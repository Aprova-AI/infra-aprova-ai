#!/bin/bash

echo "🧹 Limpando Terraform state..."

# Remover todos os recursos do state
terraform state rm azurerm_log_analytics_workspace.main 2>/dev/null || true
terraform state rm azurerm_monitor_data_collection_rule.main 2>/dev/null || true

echo "📥 Importando apenas os recursos necessários..."

# Importar apenas o Resource Group e a VM que queremos modificar
terraform import azurerm_resource_group.main /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2

# Importar apenas a VM que queremos modificar
terraform import azurerm_linux_virtual_machine.vm_large /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Compute/virtualMachines/vm-aprova-ai-1

echo "✅ State limpo e recursos importados!"
echo "🎯 Agora pode fazer terraform plan para ver apenas a mudança do disco" 