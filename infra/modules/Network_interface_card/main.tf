resource "azurerm_network_interface" "NICs" {
  for_each            = var.NIC_details
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rgname[each.value.resource_group_name]

  ip_configuration {
    name                          = each.value.ip_confg_name
    subnet_id                     = var.subnet_id[each.value.subnet_id]
    private_ip_address_allocation = each.value.private_ip_allocation
    public_ip_address_id          = var.public_ip_id[each.value.public_ip_id]
  }
}