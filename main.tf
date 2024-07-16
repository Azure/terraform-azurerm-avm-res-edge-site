resource "azapi_resource" "address" {
  count     = var.country == "" ? 0 : 1
  type      = "Microsoft.EdgeOrder/addresses@2024-02-01"
  parent_id = var.resource_group.id
  name      = var.address_resource_name
  location  = var.resource_group.location
  body = {
    properties = {
      addressClassification = "Site"
      shippingAddress = {
        addressType     = "None"
        city            = var.city
        companyName     = var.company_name
        country         = var.country
        postalCode      = var.postal_code
        stateOrProvince = var.state_or_province
        streetAddress1  = var.street_address_1
        streetAddress2  = var.street_address_2
        streetAddress3  = var.street_address_3
        zipExtendedCode = var.zip_extended_code
      }
      contactDetails = {
        contactName    = var.contact_name
        emailList      = var.email_list
        mobile         = var.mobile
        phone          = var.phone
        phoneExtension = var.phone_extension
      }
    }
  }
}

resource "azapi_resource" "site" {
  count     = var.country == "" ? 0 : 1
  type      = "Microsoft.Edge/Sites@2023-07-01-preview"
  parent_id = var.resource_group.id
  name      = var.site_resource_name
  body = {
    properties = {
      displayName       = var.site_display_name
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
