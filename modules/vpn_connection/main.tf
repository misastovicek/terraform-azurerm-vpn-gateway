resource "azurerm_local_network_gateway" "this" {
  for_each = var.connections

  name                = "${var.name}${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  gateway_address = each.value["gateway_address"]
  address_space   = each.value["address_space"]

  tags = var.tags
}

resource "azurerm_virtual_network_gateway_connection" "this" {
  for_each = var.connections

  name                = "${var.name}${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  type                       = "IPsec"
  virtual_network_gateway_id = var.virtual_network_gateway_id
  local_network_gateway_id   = azurerm_local_network_gateway.this[each.key].id

  shared_key          = each.value["shared_key"]
  connection_protocol = each.value["connection_protocol"]

  ipsec_policy {
    dh_group         = each.value["dh_group"]
    ike_encryption   = each.value["encryption"]
    ike_integrity    = each.value["integrity"]
    ipsec_encryption = each.value["encryption"]
    ipsec_integrity  = each.value["integrity"]
    pfs_group        = each.value["pfs_group"]
    sa_datasize      = each.value["sa_datasize"]
    sa_lifetime      = each.value["sa_lifetime"]
  }
}
