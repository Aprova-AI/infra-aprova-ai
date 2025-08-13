# Storage Account para logs e monitoramento
resource "azurerm_storage_account" "logs_monitoring" {
  name                     = "logsmonitoringaprovaai"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  default_to_oauth_authentication = true
  access_tier              = "Hot"
  
  tags = var.tags
}

# Container para logs
resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_name  = azurerm_storage_account.logs_monitoring.name
  container_access_type = "private"
}

# Container para monitoramento
resource "azurerm_storage_container" "monitoring" {
  name                  = "monitoring"
  storage_account_name  = azurerm_storage_account.logs_monitoring.name
  container_access_type = "private"
}
