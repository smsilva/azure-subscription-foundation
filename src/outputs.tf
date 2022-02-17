output "administrators" {
  value = local.administrators
}

output "storage_account_id" {
  value = module.storage_account.instance.id
}

output "storage_account_name" {
  value = module.storage_account.instance.name
}

output "storage_account" {
  value = module.storage_account.instance
  sensitive = true
}

output "storage_account_primary_access_key" {
  value = module.storage_account.instance.primary_access_key
  sensitive = true
}

output "storage_account_secondary_access_key" {
  value = module.storage_account.instance.secondary_access_key
  sensitive = true
}

output "vault_id" {
  value = module.vault.instance.id
}

output "vault_secret_arm_access_key_id" {
  value = module.secret_arm_access_key.instance.id
  sensitive = true
}
