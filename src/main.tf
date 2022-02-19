data "azurerm_client_config" "current" {
}

locals {
  resource_group_name = var.resource_group_name

  administrators = concat(
    [data.azurerm_client_config.current.object_id],
    var.administrators
  )
}

data "azurerm_resource_group" "default" {
  name = local.resource_group_name
}

module "vault" {
  source = "git@github.com:smsilva/azure-key-vault.git//src?ref=development"

  name           = var.key_vault_name
  resource_group = data.azurerm_resource_group.default
  administrators = local.administrators

  depends_on = [
    data.azurerm_resource_group.default
  ]
}

module "secret_arm_access_key" {
  source = "git@github.com:smsilva/azure-key-vault.git//src/secret?ref=development"

  vault = module.vault.instance
  key   = "arm-access-key"
  value = var.storage_account_access_key

  depends_on = [
    module.vault
  ]
}
