variable "resource_group_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_access_key" {
  type        = string
  description = "Storage Account Access Key"
  sensitive   = true
}

variable "administrators" {
  default = [
    "805a3d92-4178-4ad1-a0d6-70eae41a463a" # cloud-admin
  ]
}
