output "NIC_id" {
  value = {
    for key, nic_id in azurerm_network_interface.NICs :
    key => nic_id.id
  }
}