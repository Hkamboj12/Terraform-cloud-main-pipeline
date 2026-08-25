output "subnet_id" {
  value = {
    for key, sub_id in azurerm_subnet.subnets :
    key => sub_id.id
  }
}