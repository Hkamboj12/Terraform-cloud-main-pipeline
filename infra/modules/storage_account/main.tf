resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_details
  name = each.value.name
  resource_group_name = var.rgname[each.value.resource_group_name]
  location = each.value.location
  access_tier = each.value.access_tier
  account_tier = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}