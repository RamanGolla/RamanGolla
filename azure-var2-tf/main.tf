# Provider configuration
provider "azurerm" {
  features {}
}

# Variables
variable "vnet_name" {
  description = "Name of the Virtual Network"
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "Azure region where resources will be created"
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "example-resources"
}
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

