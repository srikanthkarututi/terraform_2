

resource "azurerm_network_security_group" "vmss_nsg" {
  name                = var.vmss_nsg
  location            = data.var.location.name
  resource_group_name = data.var.rg.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vmssvnet
  location            = data.var.location.name
  resource_group_name = data.var.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.sub_0
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = var.sub_1
    address_prefix = "10.0.2.0/24"
    security_group = var.vmss_nsg.id
  }
}