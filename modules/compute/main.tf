resource "azurerm_container_group" "app" {
  name                = "${var.environment}-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  dns_name_label      = "${var.environment}-nithish-app"
  os_type             = "Linux"

  container {
    name   = "${var.environment}-container"
    image  = "nithishealthmonitor.azurecr.io/health-monitoring-system:latest"
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 5000
      protocol = "TCP"
    }

    environment_variables = {
      ENVIRONMENT = var.environment
    }
  }

  image_registry_credential {
    server   = var.registry_server
    username = var.registry_username
    password = var.registry_password
  }

  tags = {
    Environment = var.environment
    Project     = "azure-multi-env-terraform"
  }
}
