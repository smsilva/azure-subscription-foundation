variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "region" {
  type    = string
  default = "eastus2"
}

variable "administrators" {
  default = [
    "805a3d92-4178-4ad1-a0d6-70eae41a463a" # cloud-admin
  ]
}
