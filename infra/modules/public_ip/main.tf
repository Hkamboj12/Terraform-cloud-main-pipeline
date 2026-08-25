resource "azurerm_public_ip" "pip_ip" {
  for_each            = var.public_ip
  name                = each.value.name
  resource_group_name = var.rgname[each.value.resource_group_name]
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}