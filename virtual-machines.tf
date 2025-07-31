# VM 1 - Aprova AI 1 (equivalente ao t4g.large)
resource "azurerm_linux_virtual_machine" "vm_large" {
  name                = "vm-aprova-ai-1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2s"
  admin_username      = var.admin_username
  
  network_interface_ids = [
    azurerm_network_interface.vm_large.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }
  
  disable_password_authentication = true
  
  tags = var.tags
}

# VM 2 - Aprova AI 2 (equivalente ao t4g.xlarge)
resource "azurerm_linux_virtual_machine" "vm_xlarge" {
  name                = "vm-aprova-ai-2"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B4ms"
  admin_username      = var.admin_username
  
  network_interface_ids = [
    azurerm_network_interface.vm_xlarge.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 50
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }
  
  disable_password_authentication = true
  
  tags = var.tags
}

# VM 3 - Aprova AI 3 (equivalente ao t4g.micro)
resource "azurerm_linux_virtual_machine" "vm_micro" {
  name                = "vm-aprova-ai-3"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = var.admin_username
  
  network_interface_ids = [
    azurerm_network_interface.vm_micro.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }
  
  disable_password_authentication = true
  
  tags = var.tags
}

# VM 4 - Aprova AI 4 (Ansible Control Node)
resource "azurerm_linux_virtual_machine" "vm_ansible" {
  name                = "vm-aprova-ai-4"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"  # Tamanho pequeno para control node
  admin_username      = var.admin_username
  
  network_interface_ids = [
    azurerm_network_interface.vm_ansible.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }
  
  disable_password_authentication = true
  
  tags = var.tags
} 