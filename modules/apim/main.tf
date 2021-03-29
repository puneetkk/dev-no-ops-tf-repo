# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

resource "azurerm_api_management" "apim" {
  name                = "dev-apim"
  location            = var.passed_location
  resource_group_name = var.passed_resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  tags                = var.passed_tags
  sku_name = var.sku

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML

  }
}