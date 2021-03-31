terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}

provider "azuread" {
  # Configuration options
  # version = "=0.7.0"
}

resource "azuread_group" "DEV-USER-GROUP" {
  display_name            = "User Group"
  description             = "Dvelopment User Group"
  owners                  = [var.group_owner]
  prevent_duplicate_names = true
}

resource "azuread_group" "DEV-ADMIN-GROUP" {
  display_name            = "Admin Group"
  description             = "Dvelopment Admin Group"
  prevent_duplicate_names = true
}