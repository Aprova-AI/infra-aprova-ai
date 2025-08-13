# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.10.0.0/24"]
  
  tags = var.tags
}

# Subnet para as VMs
resource "azurerm_subnet" "vm_subnet" {
  name                 = "snet-vm-${var.environment}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.10.0.0/24"]
}

# Public IPs para as VMs
resource "azurerm_public_ip" "vm_large" {
  name                = "pip-vm-large-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = var.tags
}

resource "azurerm_public_ip" "vm_xlarge" {
  name                = "pip-vm-xlarge-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = var.tags
}

resource "azurerm_public_ip" "vm_micro" {
  name                = "pip-vm-micro-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = var.tags
}

resource "azurerm_public_ip" "vm_ansible" {
  name                = "pip-vm-ansible-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = var.tags
}

# Temporarily commented out to avoid conflicts with existing resources
/*
resource "azurerm_public_ip" "vm_monitoring" {
  name                = "pip-vm-monitoring-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
  
  tags = var.tags
}
*/

# Network Interfaces
resource "azurerm_network_interface" "vm_large" {
  name                = "nic-vm-large-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_large.id
  }
  
  tags = var.tags
}

resource "azurerm_network_interface" "vm_xlarge" {
  name                = "nic-vm-xlarge-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_xlarge.id
  }
  
  tags = var.tags
}

resource "azurerm_network_interface" "vm_micro" {
  name                = "nic-vm-micro-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_micro.id
  }
  
  tags = var.tags
}

resource "azurerm_network_interface" "vm_ansible" {
  name                = "nic-vm-ansible-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_ansible.id
  }
  
  tags = var.tags
}

# Temporarily commented out to avoid conflicts with existing resources
/*
resource "azurerm_network_interface" "vm_monitoring" {
  name                = "nic-vm-monitoring-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_monitoring.id
  }
  
  tags = var.tags
}
*/ 