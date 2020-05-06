output "local_network_gateway_id" {
  value = { for k, v in azurerm_local_network_gateway.this : k => v.id }
}

output "virtual_network_gateway_connection_id" {
  value = { for k, v in azurerm_virtual_network_gateway_connection.this : k => v.id }
}