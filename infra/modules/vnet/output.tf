output "vnet_name" {
  value = {
    for key, vnet_name in azurerm_virtual_network.vnet :
    key => vnet_name.name
  }
}

output "vnet_id" {
  value = {
    for key, vnet_id in azurerm_virtual_network.vnet :
    key => vnet_id.id
  }
}