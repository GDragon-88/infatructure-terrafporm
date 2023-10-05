terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

locals {
  locaiton = "West us"
  name = "RSG-01"
}


module "resource_group" {
  source = "./module/resource-group"
  base_name = local.name
  locaiton = local.locaiton
}

module "virtual_network" {
  source = "./module/virtual-network"
  vnet-name = "My-Vnet01"
  locaiton = local.locaiton
  resource_group_name = module.resource_group.output-resource_group.name
  depends_on = [ module.resource_group ]
}

module "virtual_machine" {
  source = "./module/virtual-machine"
  resource_group_name = local.name
  virtual_network_name = module.virtual_network.output_virtual_network.name
  location = local.locaiton
  VM-name = "VM-01-ubuntu"
}






