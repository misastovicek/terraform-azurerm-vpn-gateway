output "vritual_network_gateway_id" {
  value = azurerm_virtual_network_gateway.this.id
}

output "public_ip_address" {
  value = azurerm_public_ip.this.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.this.id
}

output "local_network_gateway_id" {
  value = module.vpn_connection.local_network_gateway_id
}

output "virtual_network_gateway_connection_id" {
  value = module.vpn_connection.virtual_network_gateway_connection_id
}
