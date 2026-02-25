variable "location" {
  default = "eastus"
}

variable "client_id" {}
variable "client_secret" { sensitive = true }
variable "subscription_id" {}
variable "tenant_id" {}

variable "registry_server" {
  default = "nithishealthmonitor.azurecr.io"
}

variable "registry_username" {
  default = "nithishealthmonitor"
}

variable "registry_password" {
  sensitive = true
}
