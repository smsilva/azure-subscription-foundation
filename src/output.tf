output "administrators" {
  value = local.administrators
}

output "vault_id" {
  value = module.vault.instance.id
}

output "secrets" {
  value = module.secrets.instances
  sensitive = true
}
