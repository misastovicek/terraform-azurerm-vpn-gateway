variable "connections" {
  type = map(object(
    {
      gateway_address     = string
      address_space       = list(string)
      shared_key          = string
      dh_group            = string
      pfs_group           = string
      encryption          = string
      integrity           = string
      sa_datasize         = number
      sa_lifetime         = number
      connection_protocol = string
    }
  ))
  default     = {}
  description = "Defined VPN connections associated with a Virtual Network Gateway"
}

variable "name" {
  type        = string
  description = "Name used for all the resources"
}

variable "location" {
  type        = string
  description = "Location where to deploy resources"
}

variable "vpn_type" {
  type        = string
  default     = "RouteBased"
  description = "Type of the VPN - can be RouteBased or PolicyBased"
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "SKU of the Virtual Network Gateway"
}

variable "generation" {
  type        = string
  default     = "Generation1"
  description = "Generation of the Virtual Network Gateway"
}

variable "enable_bgp" {
  type        = bool
  default     = false
  description = "Whether to enable BGP on the gateway or not"
}

variable "active_active" {
  type = bool
  default = false
  description = "Whether to enable Active - Active mode of the Gateway or not"
}

variable "subnet_id" {
  type        = string
  description = "ID of the GatewaySubnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags associated with the resources"
}
