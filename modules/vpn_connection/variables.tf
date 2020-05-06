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
  description = "Defined VPN connections associated with a Virtual Network Gateway"
}

variable "name" {
  type        = string
  description = "Name which will be used as a prefix for all the resources"
}

variable "location" {
  type        = string
  description = "Location where to deploy resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group into which to deploy the resources"
}

variable "virtual_network_gateway_id" {
  type        = string
  description = "ID of the Virtual Network Gateway"
}

variable "tags" {
  type        = map(string)
  description = "Tags associated with the resources"
}
