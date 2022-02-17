resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = local.resource_group_location
}

module "storage_account" {
  source = "git@github.com:smsilva/azure-storage-account.git//src?ref=development"

  name           = local.storage_account_name
  resource_group = azurerm_resource_group.default
}

module "storage_account_container" {
  source = "git@github.com:smsilva/azure-storage-account.git//src/container?ref=development"

  storage_account = module.storage_account.instance
  name            = "terraform"
}

module "vault" {
  source = "git@github.com:smsilva/azure-key-vault.git//src?ref=development"

  name           = local.key_vault_name
  resource_group = azurerm_resource_group.default
  administrators = local.administrators

  depends_on = [
    azurerm_resource_group.default
  ]
}

module "secret_arm_access_key" {
  source = "git@github.com:smsilva/azure-key-vault.git//src/secret?ref=development"

  vault = module.vault.instance
  key   = "arm-access-key"
  value = module.storage_account.instance.primary_access_key

  depends_on = [
    module.vault
  ]
}
