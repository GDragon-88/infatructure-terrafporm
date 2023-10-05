


resource "azurerm_virtual_network" "az-vnet" {
  name                = var.vnet-name
  location            = var.locaiton
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

 

  tags = {
    environment = "develop"
  }
}
