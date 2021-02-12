// Terraform configuration
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

// Virtual Network module
module "virtual_network" {
  source = "./vm"
  // variables passed down to child modules here
}

// Virtual Machines module
module "virtual_machines" {
  source = "./vnet"
  // variables passed down to child modules here
}
