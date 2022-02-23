locals {
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_region
  storage_account_name    = var.storage_account_name
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = local.resource_group_location
  tags     = var.tags
}

module "storage_account" {
  source = "git@github.com:smsilva/azure-storage-account.git//src?ref=development"

  name           = local.storage_account_name
  resource_group = azurerm_resource_group.default
  tags           = var.tags
}

module "storage_account_container" {
  source = "git@github.com:smsilva/azure-storage-account.git//src/container?ref=development"

  storage_account = module.storage_account.instance
  name            = "terraform"
}
