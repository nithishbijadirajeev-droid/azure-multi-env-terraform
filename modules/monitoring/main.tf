resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${var.environment}-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    Environment = var.environment
    Project     = "azure-multi-env-terraform"
  }
}

resource "azurerm_monitor_action_group" "alerts" {
  name                = "${var.environment}-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "${var.environment}alert"

  tags = {
    Environment = var.environment
    Project     = "azure-multi-env-terraform"
  }
}
