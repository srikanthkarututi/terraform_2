

data "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_role_assignment" "rgroleassignmt" {
  scope                = var.rg.id
  role_definition_name = "Contributor"
  principal_id         = var.principal_id
}