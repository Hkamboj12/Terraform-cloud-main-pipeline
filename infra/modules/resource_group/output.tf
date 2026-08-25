output "rg_name" {
  value = {
    for key, rg_name in azurerm_resource_group.rg :
    key => rg_name.name
  }
}