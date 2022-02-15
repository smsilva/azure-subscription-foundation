resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = local.resource_group_location
}

module "storage_account" {
  source = "git@github.com:smsilva/azure-storage-account.git//src?ref=0.1.0"

  name           = local.storage_account_name
  resource_group = azurerm_resource_group.default
}
