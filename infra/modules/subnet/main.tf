resource "azurerm_subnet" "subnets" {
  for_each             = var.subnet_details
  name                 = each.value.name
  resource_group_name  = var.rgname[each.value.resource_group]
  virtual_network_name = var.vnetName[each.value.virtual_network_name]
  address_prefixes     = each.value.address_prefixes
}