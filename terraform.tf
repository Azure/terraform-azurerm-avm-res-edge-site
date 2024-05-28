terraform {
  required_version = "~> 1.5"
  required_providers {
    # TODO: Ensure all required providers are listed here and the version property includes a constraint on the maximum major version.
    azapi = {
      source  = "azure/azapi"
      version = "~>1.13"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71"
    }
  }
}
