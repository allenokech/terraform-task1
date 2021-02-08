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
resource "azurerm_virtual_network" "example" {
  name                = "${var.project_name}-vnet"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

// Subnet


// Public IP


// Network Security Group


// Network Interface/NSG Group Association


// Network Interface


// Linux Virtual Machine
