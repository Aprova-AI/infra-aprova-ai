@echo off
echo ========================================
echo IMPORTANDO RECURSOS EXISTENTES DO AZURE
echo ========================================
echo.

echo [1/5] Importando Network Interfaces...
terraform import azurerm_network_interface.vm_large /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-large-prod
terraform import azurerm_network_interface.vm_xlarge /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-xlarge-prod
terraform import azurerm_network_interface.vm_micro /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-micro-prod
terraform import azurerm_network_interface.vm_ansible /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-ansible-prod
echo.

echo [2/5] Importando Network Security Rules (Micro)...
terraform import azurerm_network_security_rule.micro_ssh /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod/securityRules/SSH
terraform import azurerm_network_security_rule.micro_http /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod/securityRules/HTTP
terraform import azurerm_network_security_rule.micro_https /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod/securityRules/HTTPS
terraform import azurerm_network_security_rule.micro_udp_10447 /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod/securityRules/UDP-10447
echo.

echo [3/5] Importando Network Security Rules (Large)...
terraform import azurerm_network_security_rule.large_ssh /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/SSH
terraform import azurerm_network_security_rule.large_http /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/HTTP
terraform import azurerm_network_security_rule.large_https /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/HTTPS
terraform import azurerm_network_security_rule.large_postgres /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/PostgreSQL
terraform import azurerm_network_security_rule.large_port_27072 /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/Port-27072
echo.

echo [4/5] Importando Network Security Rules (XLarge e Ansible)...
terraform import azurerm_network_security_rule.xlarge_ssh /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/SSH
terraform import azurerm_network_security_rule.xlarge_ftp /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/FTP
terraform import azurerm_network_security_rule.xlarge_https /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/HTTPS
terraform import azurerm_network_security_rule.xlarge_port_27072 /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/Port-27072
terraform import azurerm_network_security_rule.xlarge_postgres /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod/securityRules/PostgreSQL
terraform import azurerm_network_security_rule.ansible_ssh /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-ansible-prod/securityRules/SSH
echo.

echo [5/5] Importando Network Interface Security Group Associations e VMs...
terraform import azurerm_network_interface_security_group_association.vm_large /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-large-prod^|/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod
terraform import azurerm_network_interface_security_group_association.vm_xlarge /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-xlarge-prod^|/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-xlarge-prod
terraform import azurerm_network_interface_security_group_association.vm_micro /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-micro-prod^|/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-micro-prod
terraform import azurerm_network_interface_security_group_association.vm_ansible /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkInterfaces/nic-vm-ansible-prod^|/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-ansible-prod
terraform import azurerm_linux_virtual_machine.vm_micro /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Compute/virtualMachines/vm-aprova-ai-2
terraform import azurerm_linux_virtual_machine.vm_xlarge /subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Compute/virtualMachines/vm-aprova-ai-3
echo.

echo ========================================
echo IMPORTACAO CONCLUIDA!
echo ========================================
echo.
echo Agora execute: terraform plan
echo.
pause 