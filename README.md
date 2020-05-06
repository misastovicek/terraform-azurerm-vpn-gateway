# Site to Site VPN

This module will create Virtual Network Gateway on Azure with associated public IP address. It may also create multiple Local Network Gateways with VPN connections

## Parameters

|Name|Type|Description|Default|
|----|----|-----------|-------|
|name|string|Name used for all the resources|-|
|location|string|Location where to deploy resources|-|
|resource_group_name|string|Resource group into which to deploy the resources|-|
|vpn_type|string|Type of the VPN - can be RouteBased or PolicyBased|RouteBased|
|sku|string|SKU of the Virtual Network Gateway|Basic|
|generation|string|Generation of the Virtual Network Gateway|Generation1|
|enable_bgp|bool|Whether to enable BGP on the gateway or not|false|
|active_active|bool|Whether to enable Active - Active mode on the gateway or not|false|
|subnet_id|string|ID of the GatewaySubnet|-|
|tags|map(string)|Tags associated with the resources|{}|
|connections|map(object({}))|Defined VPN connections associated with a Virtual Network Gateway|{}|

***Connections*** parameter accepts a map of objects where each object has the following atributes:

|Name|Type|Description|
|----|----|-----------|
|gateway_address|string|Address of the Local network gateway|
|address_space|list(string)|IP prefixes which will be accessed through the VPN connection|
|shared_key|string|Pre-shared key used to establish IPsec VPN connection|
|dh_group|string|Diffie Hellman group for IKE|
|pfs_group|string|Diffie Hellman group for IPsec Perfect Forward Secrecy|
|encryption|string|IKE and IPsec encryption algorithm (the same for both)|
|integrity|string|IKE and IPsec integrity algorithm (the same for both|
|sa_datasize|number|IPsec security association payload size in KB|
|sa_lifetime|number|IPsec security association lifetime in seconds|
|connection_protocol|number|IPsec security association lifetime in seconds|

>**NOTE:** Connections are used to define multiple VPN connections for a single Virtual Network Gateway
