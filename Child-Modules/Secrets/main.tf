data "azurerm_key_vault" "keyv" {
  for_each            =  var.secrets_config 
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group
}
resource "azurerm_key_vault_secret" "secrets" {
  for_each     =   var.secrets_config
  name         = each.value.secret_name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.keyv[each.key].id
    lifecycle {
    create_before_destroy = true
  }
}

# resource "random_password" "vm_admin_password" {
#   length           = 16
#   special          = true
#   upper            = true
#   lower            = true
#   number           = true
  
# }

# resource "azurerm_key_vault_secret" "secrets" {
#   for_each     = var.secrets_config
#   name         = each.value.secret_name
#   value        = random_password.vm_admin_password.result
#   key_vault_id = data.azurerm_key_vault.keyv[each.key].id
# }
