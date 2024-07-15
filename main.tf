resource "azapi_resource" "address" {
  count     = var.country == "" ? 0 : 1
  type      = "Microsoft.EdgeOrder/addresses@2024-02-01"
  parent_id = var.resourceGroup.id
  name      = var.addressResourceName
  location  = var.resourceGroup.location
  body = {
    properties = {
      addressClassification = "Site"
      shippingAddress = {
        addressType     = "None"
        city            = var.city
        companyName     = var.companyName
        country         = var.country
        postalCode      = var.postalCode
        stateOrProvince = var.stateOrProvince
        streetAddress1  = var.streetAddress1
        streetAddress2  = var.streetAddress2
        streetAddress3  = var.streetAddress3
        zipExtendedCode = var.zipExtendedCode
      }
      contactDetails = {
        contactName    = var.contactName
        emailList      = var.emailList
        mobile         = var.mobile
        phone          = var.phone
        phoneExtension = var.phoneExtension
      }
    }
  }
}

resource "azapi_resource" "site" {
  count     = var.country == "" ? 0 : 1
  type      = "Microsoft.Edge/Sites@2023-07-01-preview"
  parent_id = var.resourceGroup.id
  name      = var.siteResourceName
  body = {
    properties = {
      displayName       = var.siteDisplayName
      addressResourceId = azapi_resource.address[0].id
    }
  }
  schema_validation_enabled = false
}

# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.lock.kind}")
  scope      = azapi_resource.address[0].id
  notes      = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  principal_id                           = each.value.principal_id
  scope                                  = azapi_resource.address[0].id
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  role_definition_id                     = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? each.value.role_definition_id_or_name : null
  role_definition_name                   = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : each.value.role_definition_id_or_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}
