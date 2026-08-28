resource "azurerm_windows_virtual_machine" "example" {
  for_each              = var.windows_server
  name                  = each.value.name
  resource_group_name   = var.rgname[each.value.resource_group_name]
  location              = each.value.location
  size                  = "Standard_D4_v5"
  admin_username        = "dev"
  admin_password        = "Kamboj@203040"
  network_interface_ids = [var.nic_id[each.value.network_interface_id]]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  custom_data = base64decode(file("${path.module}/cloud-init.yaml"))
}