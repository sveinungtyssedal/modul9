terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

locals {
  common_tags = {
    owner      = var.student_id
    course     = "iac"
    module     = "modul7"
    managed_by = "pipeline4"
  }
}


module "network" {
  source              = "git::https://github.com/sveinungtyssedal/modul8.git//tf/modules/network?ref=network-v1.1.0"
  project             = var.project
  location            = var.location
  resource_group_name = "rg-demo-backend-042"
}

resource "random_password" "demo" {
  length  = 24
  special = true
}
