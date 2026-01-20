resource "azurerm_subnet" "subnet" {
  for_each             = var.snet_name   
  name                 = each.value.snet_name   
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}