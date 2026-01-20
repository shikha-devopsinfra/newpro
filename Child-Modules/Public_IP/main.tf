resource "azurerm_public_ip" "pip_name" {
  for_each            =  var.pip_name
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}