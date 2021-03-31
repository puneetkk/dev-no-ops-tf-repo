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
}

resource "azuread_group" "DEV-ADMIN-GROUP" {
  display_name            = "Admin Group"
  description             = "Dvelopment Admin Group"
  owners                  = [var.group_owner]
}

resource "azuread_application" "myTFDevSPAFrontEnd" {
    display_name               = "myTFDevSPAFrontEnd"
    homepage                   = "https://homepage"
    identifier_uris            = ["https://uri"]
    reply_urls                 = ["https://replyurl"]
    available_to_other_tenants = false
    oauth2_allow_implicit_flow = false
    owners                     = [var.group_owner]


}

resource "azuread_application_app_role" "AdminRole" {
  application_object_id = azuread_application.myTFDevSPAFrontEnd.id
  allowed_member_types  = ["User"]
  description           = "Admins can manage roles and perform all task actions"
  display_name          = "Admin"
  is_enabled            = true
  value                 = "administer"
}