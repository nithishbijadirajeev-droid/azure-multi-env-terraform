output "app_url" {
  value = "http://${azurerm_container_group.app.fqdn}:5000"
}

output "app_ip" {
  value = azurerm_container_group.app.ip_address
}

output "fqdn" {
  value = azurerm_container_group.app.fqdn
}
