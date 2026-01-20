data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "Key_Vault" {
  for_each                    = var.key_vault_config
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get","Set", "List", "Delete", "Purge", "Recover", "Backup"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
