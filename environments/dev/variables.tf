variable "location" {
  description = "Azure region"
  default     = "eastus"
}

variable "registry_server" {
  description = "Container registry server"
  default     = "nithishealthmonitor.azurecr.io"
}

variable "registry_username" {
  description = "Container registry username"
  default     = "nithishealthmonitor"
}

variable "registry_password" {
  description = "Container registry password"
  sensitive   = true
}
