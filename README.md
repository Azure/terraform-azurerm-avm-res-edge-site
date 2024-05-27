<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-template

This is a template repo for Terraform Azure Verified Modules.

Things to do:

1. Set up a GitHub repo environment called `test`.
1. Configure environment protection rule to ensure that approval is required before deploying to this environment.
1. Create a user-assigned managed identity in your test subscription.
1. Create a role assignment for the managed identity on your test subscription, use the minimum required role.
1. Configure federated identity credentials on the user assigned managed identity. Use the GitHub environment.
1. Search and update TODOs within the code and remove the TODO comments once complete.

> [!IMPORTANT]
> As the overall AVM framework is not GA (generally available) yet - the CI framework and test automation is not fully functional and implemented across all supported languages yet - breaking changes are expected, and additional customer feedback is yet to be gathered and incorporated. Hence, modules **MUST NOT** be published at version `1.0.0` or higher at this time.
>
> All module **MUST** be published as a pre-release version (e.g., `0.1.0`, `0.1.1`, `0.2.0`, etc.) until the AVM framework becomes GA.
>
> However, it is important to note that this **DOES NOT** mean that the modules cannot be consumed and utilized. They **CAN** be leveraged in all types of environments (dev, test, prod etc.). Consumers can treat them just like any other IaC module and raise issues or feature requests against them as they learn from the usage of the module. Consumers should also read the release notes for each version, if considering updating to a more recent version of a module to see if there are any considerations or breaking changes etc.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.5)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.71)

## Providers

The following providers are used by this module:

- <a name="provider_azapi"></a> [azapi](#provider\_azapi)

## Resources

The following resources are used by this module:

- [azapi_resource.address](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) (resource)
- [azapi_resource.site](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_resourceGroup"></a> [resourceGroup](#input\_resourceGroup)

Description: The resource group of the site.

Type: `any`

### <a name="input_siteId"></a> [siteId](#input\_siteId)

Description: A unique identifier for the site.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_city"></a> [city](#input\_city)

Description: The city of the site.

Type: `string`

Default: `""`

### <a name="input_companyName"></a> [companyName](#input\_companyName)

Description: The company name of the site.

Type: `string`

Default: `""`

### <a name="input_contactName"></a> [contactName](#input\_contactName)

Description: The contact name of the site.

Type: `string`

Default: `" "`

### <a name="input_country"></a> [country](#input\_country)

Description: The order country of the site.

Type: `string`

Default: `""`

### <a name="input_emailList"></a> [emailList](#input\_emailList)

Description: A list of email addresses for the site.

Type: `list(string)`

Default: `[]`

### <a name="input_mobile"></a> [mobile](#input\_mobile)

Description: The mobile phone number of the site.

Type: `string`

Default: `""`

### <a name="input_phone"></a> [phone](#input\_phone)

Description: The phone number of the site.

Type: `string`

Default: `""`

### <a name="input_phoneExtension"></a> [phoneExtension](#input\_phoneExtension)

Description: The phone extension of the site.

Type: `string`

Default: `""`

### <a name="input_postalCode"></a> [postalCode](#input\_postalCode)

Description: The postal code of the site.

Type: `string`

Default: `""`

### <a name="input_stateOrProvince"></a> [stateOrProvince](#input\_stateOrProvince)

Description: The state or province of the site.

Type: `string`

Default: `""`

### <a name="input_streetAddress1"></a> [streetAddress1](#input\_streetAddress1)

Description: The first line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_streetAddress2"></a> [streetAddress2](#input\_streetAddress2)

Description: The second line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_streetAddress3"></a> [streetAddress3](#input\_streetAddress3)

Description: The third line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_zipExtendedCode"></a> [zipExtendedCode](#input\_zipExtendedCode)

Description: The extended ZIP code of the site.

Type: `string`

Default: `""`

## Outputs

No outputs.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->