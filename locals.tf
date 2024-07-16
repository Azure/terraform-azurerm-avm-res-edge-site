# TODO: insert locals here.
locals {
  resource_group_name                = element(split("/", var.resource_group_id), length(split("/", var.resource_group_id)) - 1)
  role_definition_resource_substring = "/providers/Microsoft.Authorization/roleDefinitions"
}
