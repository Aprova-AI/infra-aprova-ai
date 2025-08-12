# Network Security Groups para cada VM

# NSG para VM Micro
resource "azurerm_network_security_group" "vm_micro" {
  name                = "nsg-vm-micro-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  tags = var.tags
}

# Regras do NSG para VM Micro
        resource "azurerm_network_security_rule" "micro_ssh" {
          name                        = "SSH"
          priority                    = 1001
          direction                   = "Inbound"
          access                      = "Allow"
          protocol                    = "Tcp"
          source_port_range           = "*"
          destination_port_range      = "22"
          source_address_prefix       = var.allowed_ssh_ips[0]
          destination_address_prefix  = "*"
          resource_group_name         = azurerm_resource_group.main.name
          network_security_group_name = azurerm_network_security_group.vm_micro.name
        }

resource "azurerm_network_security_rule" "micro_http" {
  name                        = "HTTP"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_micro.name
}

resource "azurerm_network_security_rule" "micro_https" {
  name                        = "HTTPS"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_micro.name
}

resource "azurerm_network_security_rule" "micro_udp_10447" {
  name                        = "UDP-10447"
  priority                    = 1004
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "10447"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_micro.name
}

# NSG para VM Large
resource "azurerm_network_security_group" "vm_large" {
  name                = "nsg-vm-large-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  tags = var.tags
}

# Regras do NSG para VM Large
        resource "azurerm_network_security_rule" "large_ssh" {
          name                        = "SSH"
          priority                    = 1001
          direction                   = "Inbound"
          access                      = "Allow"
          protocol                    = "Tcp"
          source_port_range           = "*"
          destination_port_range      = "22"
          source_address_prefix       = var.allowed_ssh_ips[0]
          destination_address_prefix  = "*"
          resource_group_name         = azurerm_resource_group.main.name
          network_security_group_name = azurerm_network_security_group.vm_large.name
        }

resource "azurerm_network_security_rule" "large_http" {
  name                        = "HTTP"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_large.name
}

resource "azurerm_network_security_rule" "large_https" {
  name                        = "HTTPS"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_large.name
}

resource "azurerm_network_security_rule" "large_postgres" {
  name                        = "PostgreSQL"
  priority                    = 1004
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_large.name
}

resource "azurerm_network_security_rule" "large_port_27072" {
  name                        = "Port-27072"
  priority                    = 1005
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "27072"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_large.name
}

# Regra para Coolify na VM Large
resource "azurerm_network_security_rule" "large_coolify" {
  name                        = "Coolify"
  priority                    = 1006
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_large.name
}

# Import da regra Coolify existente
import {
  to = azurerm_network_security_rule.large_coolify
  id = "/subscriptions/a346bbab-4a12-49d7-ac00-819eb93c7802/resourceGroups/rg-aprova-ai-prod-v2/providers/Microsoft.Network/networkSecurityGroups/nsg-vm-large-prod/securityRules/Coolify"
}

# NSG para VM XLarge
resource "azurerm_network_security_group" "vm_xlarge" {
  name                = "nsg-vm-xlarge-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  tags = var.tags
}

# Regras do NSG para VM XLarge
        resource "azurerm_network_security_rule" "xlarge_ssh" {
          name                        = "SSH"
          priority                    = 1001
          direction                   = "Inbound"
          access                      = "Allow"
          protocol                    = "Tcp"
          source_port_range           = "*"
          destination_port_range      = "22"
          source_address_prefix       = var.allowed_ssh_ips[0]
          destination_address_prefix  = "*"
          resource_group_name         = azurerm_resource_group.main.name
          network_security_group_name = azurerm_network_security_group.vm_xlarge.name
        }

resource "azurerm_network_security_rule" "xlarge_ftp" {
  name                        = "FTP"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "21"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_xlarge.name
}

resource "azurerm_network_security_rule" "xlarge_https" {
  name                        = "HTTPS"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_xlarge.name
}

resource "azurerm_network_security_rule" "xlarge_port_27072" {
  name                        = "Port-27072"
  priority                    = 1004
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "27072"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_xlarge.name
}

resource "azurerm_network_security_rule" "xlarge_postgres" {
  name                        = "PostgreSQL"
  priority                    = 1005
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_xlarge.name
}

# Associar NSGs às Network Interfaces
resource "azurerm_network_interface_security_group_association" "vm_large" {
  network_interface_id      = azurerm_network_interface.vm_large.id
  network_security_group_id = azurerm_network_security_group.vm_large.id
}

resource "azurerm_network_interface_security_group_association" "vm_xlarge" {
  network_interface_id      = azurerm_network_interface.vm_xlarge.id
  network_security_group_id = azurerm_network_security_group.vm_xlarge.id
}

resource "azurerm_network_interface_security_group_association" "vm_micro" {
  network_interface_id      = azurerm_network_interface.vm_micro.id
  network_security_group_id = azurerm_network_security_group.vm_micro.id
}

# NSG para VM Ansible
resource "azurerm_network_security_group" "vm_ansible" {
  name                = "nsg-vm-ansible-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  tags = var.tags
}

# Regras do NSG para VM Ansible
        resource "azurerm_network_security_rule" "ansible_ssh" {
          name                        = "SSH"
          priority                    = 1001
          direction                   = "Inbound"
          access                      = "Allow"
          protocol                    = "Tcp"
          source_port_range           = "*"
          destination_port_range      = "22"
          source_address_prefix       = var.allowed_ssh_ips[0]
          destination_address_prefix  = "*"
          resource_group_name         = azurerm_resource_group.main.name
          network_security_group_name = azurerm_network_security_group.vm_ansible.name
        }

resource "azurerm_network_interface_security_group_association" "vm_ansible" {
  network_interface_id      = azurerm_network_interface.vm_ansible.id
  network_security_group_id = azurerm_network_security_group.vm_ansible.id
}

# NSG para VM Monitoring
resource "azurerm_network_security_group" "vm_monitoring" {
  name                = "nsg-vm-monitoring-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  
  tags = var.tags
}

# Regras do NSG para VM Monitoring
resource "azurerm_network_security_rule" "monitoring_ssh" {
  name                        = "SSH"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowed_ssh_ips[0]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_monitoring.name
}

resource "azurerm_network_security_rule" "monitoring_http" {
  name                        = "HTTP"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_monitoring.name
}

resource "azurerm_network_security_rule" "monitoring_https" {
  name                        = "HTTPS"
  priority                    = 1003
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.vm_monitoring.name
}

resource "azurerm_network_interface_security_group_association" "vm_monitoring" {
  network_interface_id      = azurerm_network_interface.vm_monitoring.id
  network_security_group_id = azurerm_network_security_group.vm_monitoring.id
} 