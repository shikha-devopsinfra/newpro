data "azurerm_subnet" "subnet" {

  for_each             =  var.vm_config 
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group
}
data "azurerm_public_ip" "pip" {
  for_each            =  var.vm_config
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group
}

# data "azurerm_key_vault" "keyv" {
#   for_each = var.vm_config
#   name                = each.value.kv_name
#   resource_group_name = each.value.resource_group
# }
# data "azurerm_key_vault_secret" "vmuser" {
#   for_each = var.vm_config
#   name         = each.value.secret_name
#   key_vault_id = data.azurerm_key_vault.keyv[each.key].id
# }
# data "azurerm_key_vault_secret" "vmpsw" {
#   for_each = var.vm_config
#   name         = each.value.secret_name
#   key_vault_id = data.azurerm_key_vault.keyv[each.key].id
# }
