resource "azurerm_resource_group" "rg" {
  for_each = var.rg_details
  name     = each.value.name
  location = each.value.location
  tags = {
    name = each.value.tag_name
  }
}