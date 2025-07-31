# Log Analytics Workspace para monitoramento
resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  
  tags = var.tags
}

# Azure Monitor Agent para as VMs
resource "azurerm_monitor_data_collection_rule" "main" {
  name                = "dcr-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.main.id
      name                  = "logAnalytics"
    }
  }

  data_flow {
    streams      = ["Microsoft-Syslog", "Microsoft-Perf"]
    destinations = ["logAnalytics"]
  }

  data_sources {
    syslog {
      name    = "syslog"
      streams = ["Microsoft-Syslog"]
      facility_names = ["*"]
      log_levels     = ["*"]
    }
    
    performance_counter {
      name                          = "perf"
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["*"]
    }
  }
  
  tags = var.tags
} 