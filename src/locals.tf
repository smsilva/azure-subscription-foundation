data "azurerm_client_config" "current" {
}

locals {
  resource_group_name     = var.resource_group_name
  resource_group_location = var.region
  subscription_id_prefix  = substr(data.azurerm_client_config.current.subscription_id, 0, 8)
  key_vault_name          = "${var.name}${local.subscription_id_prefix}"
  storage_account_name    = "${var.name}${local.subscription_id_prefix}"

  administrators = concat(
    [data.azurerm_client_config.current.object_id],
    var.administrators
  )
}
