terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.2"
}

# This is required for resource modules
resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = module.naming.resource_group.name_unique
}

# This is the module call
# Do not specify location here due to the randomization above.
# Leaving location as `null` will cause the module to use the resource group location
# with a data source.
module "test" {
  source = "../../"

  country = "US"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  # ...
  resource_group_id  = azurerm_resource_group.rg.id
  site_display_name  = "test"
  site_resource_name = "test"
  enable_telemetry   = var.enable_telemetry
}
