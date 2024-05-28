output "address_resource" {
  description = "The address resource."
  value = {
    id                  = azapi_resource.address.id
    name                = azapi_resource.address.name
    resource_group_name = var.resourceGroup.name
    location            = azapi_resource.address.location

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

output "id" {
  description = "The ID of the resource."
  value       = azapi_resource.site.id
}

output "name" {
  description = "The name of the resource"
  value       = azapi_resource.site.name
}

output "site_resource" {
  description = "The site manager resource."
  value = {
    id                  = azapi_resource.site.id
    name                = azapi_resource.site.name
    resource_group_name = var.resourceGroup.name
    location            = azapi_resource.site.location
  }
}
