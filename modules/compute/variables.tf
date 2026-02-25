variable "environment" {
  description = "Environment name"
}

variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "cpu" {
  description = "CPU cores for container"
  default     = "1"
}

variable "memory" {
  description = "Memory in GB for container"
  default     = "1.5"
}

variable "registry_server" {
  description = "Container registry server"
}

variable "registry_username" {
  description = "Container registry username"
}

variable "registry_password" {
  description = "Container registry password"
  sensitive   = true
}
