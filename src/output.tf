output "administrators" {
  value = local.administrators
}

output "vault_id" {
  value = module.vault.instance.id
}

output "vault_secret_arm_access_key_id" {
  value = module.secret_arm_access_key.instance.id
  sensitive = true
}
