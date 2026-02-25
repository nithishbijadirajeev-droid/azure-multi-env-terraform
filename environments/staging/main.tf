terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "staging-rg"
  location = var.location

  tags = {
    Environment = "staging"
    Project     = "azure-multi-env-terraform"
  }
}

module "networking" {
  source              = "../../modules/networking"
  environment         = "staging"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = "10.1.0.0/16"
  subnet_prefix       = "10.1.1.0/24"
}

module "compute" {
  source              = "../../modules/compute"
  environment         = "staging"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  cpu                 = "1"
  memory              = "1.5"
  registry_server     = var.registry_server
  registry_username   = var.registry_username
  registry_password   = var.registry_password
}

module "monitoring" {
  source              = "../../modules/monitoring"
  environment         = "staging"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}
