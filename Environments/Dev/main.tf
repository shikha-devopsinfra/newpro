module "rg_name" {
  source = "../../Child-Modules/Resource_Group"

  resource_group = var.rgs

}
module "vnet" {
  source     = "../../Child-Modules/Virtual_Network"
  depends_on = [module.rg_name]

  vnet_name = var.vnets
}
module "subnet" {
  source     = "../../Child-Modules/Subnets"
  depends_on = [module.vnet]

  snet_name = var.subnets
}
module "pip_name" {
  source     = "../../Child-Modules/Public_IP"
  depends_on = [module.rg_name]

  pip_name = var.public_ips
}

module "virtual_machine" {
  source     = "../../Child-Modules/Linux_VM"
  depends_on = [module.subnet, module.key_vault, module.pip_name,module.secret_user,module.secret_paswd]

  vm_config = var.virtual_machine_config

}
# module "key_vault" {
#   source     = "../../Child-Modules/Key_Vault"
#   depends_on = [module.rg_name]

#   key_vault_config = var.key_vaults

# }
# module "secret_user" {
#   source     = "../../Child-Modules/Secrets"
#   depends_on = [module.key_vault]

#   secrets_config = var.secrets

# }
# module "secret_paswd" {
#   source     = "../../Child-Modules/Secrets"
#   depends_on = [module.key_vault]

#   secrets_config = var.secrets

# }
