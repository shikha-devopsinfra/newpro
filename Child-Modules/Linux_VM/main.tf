resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_config
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          =  data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vm_config
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher_image
    offer     = each.value.offer_image
    sku       = each.value.sku_image
    version   = each.value.version_image
  }
}