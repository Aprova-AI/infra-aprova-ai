#!/bin/bash

echo "Checking existing Azure resources..."

# List all resources in the resource group
az resource list --resource-group rg-aprova-ai-prod-v2 --output table

echo ""
echo "Checking specific resources..."

# Check Resource Group
az group show --name rg-aprova-ai-prod-v2

# Check Virtual Network
az network vnet show --resource-group rg-aprova-ai-prod-v2 --name vnet-prod

# Check Public IPs
az network public-ip list --resource-group rg-aprova-ai-prod-v2 --output table

# Check Network Security Groups
az network nsg list --resource-group rg-aprova-ai-prod-v2 --output table

# Check VMs
az vm list --resource-group rg-aprova-ai-prod-v2 --output table

# Check Log Analytics Workspace
az monitor log-analytics workspace show --resource-group rg-aprova-ai-prod-v2 --workspace-name law-prod 