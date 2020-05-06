resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  
  tags = merge(
    var.tags,
    {
      Source = "Terraform"
    }
  )
}

resource "azurerm_public_ip" "this" {
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  name                = var.name

  allocation_method = "Dynamic"
  sku               = "Basic"

  tags = merge(
    var.tags,
    {
      Source = "Terraform"
    }
  )
}

resource "azurerm_virtual_network_gateway" "this" {
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  name                = var.name

  type          = "Vpn"
  vpn_type      = var.vpn_type
  enable_bgp    = var.enable_bgp
  active_active = var.active_active
  sku           = var.sku
  generation    = var.generation

  ip_configuration {
    name                 = "${var.name}GwConfig"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }

}

module "vpn_connection" {
  source = "./modules/vpn_connection"

  name                       = var.name
  connections                = var.connections
  location                   = var.location
  resource_group_name        = azurerm_resource_group.this.name
  virtual_network_gateway_id = azurerm_virtual_network_gateway.this.id

  tags = merge(
    var.tags,
    {
      Source = "Terraform"
    }
  )
}