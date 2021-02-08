// Terraform Config Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

// Provider
provider "azurerm" {
  features {}
}

// Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-rg"
  location = var.location
}

// Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name  
  address_space       = ["10.0.0.0/16"]
}

// Subnet
resource "azurerm_subnet" "example" {
  name                 = "${var.project_name}-public-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}
// Public IP
resource "azurerm_public_ip" "main" {
  name                = "${var.project_name}-pubip"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  allocation_method   = "Dynamic"

// Network Security Group
resource "azurerm_network_security_group" "main" {
  name                = "${var.project_name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
// Network Interface/NSG Group Association


// Network Interface


// Linux Virtual Machine
