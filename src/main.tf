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
  source = "git@github.com:smsilva/azure-key-vault.git//src?ref=0.3.0"

  name           = var.key_vault_name
  resource_group = data.azurerm_resource_group.default
  administrators = local.administrators

  depends_on = [
    data.azurerm_resource_group.default
  ]
}

module "secrets" {
  source = "git@github.com:smsilva/azure-key-vault.git//src/secrets?ref=0.3.0"

  vault = module.vault.instance
  values = {
    "service-principal-tenant-id" = data.azurerm_client_config.current.tenant_id
    "service-principal-object-id" = data.azurerm_client_config.current.object_id
    "arm-storage-account-name"    = var.storage_account_name
    "arm-access-key"              = var.storage_account_access_key
  }

  depends_on = [
    module.vault
  ]
}
