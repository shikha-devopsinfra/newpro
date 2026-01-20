rgs = {
  rg141 = {
    name     = "rg-dev-infranew"
    location = "Canada Central"
  }
}

vnets = {
  vnet = {
    name           = "vnet-dev-infratodo"
    location       = "Canada Central"
    resource_group = "rg-dev-infranew"
    address_space  = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    snet_name             = "subnet1-dev-infratodo"
    resource_group   = "rg-dev-infranew"
    vnet_name        = "vnet-dev-infratodo"
    address_prefixes = ["10.0.1.0/24"]
  },
  subnet2 = {
    snet_name             = "subnet2-dev-infratodo"
    resource_group   = "rg-dev-infranew"
    vnet_name        = "vnet-dev-infratodo"
    address_prefixes = ["10.0.2.0/24"]
  }
}

public_ips = {
  pip_frontend = {
    name                = "pip-frontend-dev-infratodo"
    resource_group = "rg-dev-infranew"
    location            = "Canada Central"
    allocation_method   = "Static"
  },
  pip_backend = {
    name                = "pip-backend-dev-infratodo"
    resource_group = "rg-dev-infranew"
    location            = "Canada Central"
    allocation_method   = "Static"
  }
}



virtual_machine_config = {
  frontend_linux_vm = {
    nic_name       = "nic-frontend-dev-infratodo"
    resource_group = "rg-dev-infranew"
    location       = "Canada Central"
    vm_name        = "vm-frontend-dev-infratodo"
    vnet_name      = "vnet-dev-infratodo"
    snet_name      = "subnet1-dev-infratodo"
    pip_name       = "pip-frontend-dev-infratodo"
    size           = "Standard_B2s"

    admin_username = "shikhaaryan"
    admin_password = "Azuredevops@8"

   #  publisher_image = "Canonical"
#     offer_image     = "UbuntuServer"
#     sku_image       = "18_04-lts-gen2"
#     version_image   = "latest"

publisher_image = "Canonical"
offer_image    = "0001-com-ubuntu-server-jammy"
sku_image       = "22_04-lts-gen2"
version_image  = "latest"


    kv_name     = "imaxkey"
    secret_name = "imaxadmin"
  }


  backend_linux_vm = {
    nic_name       = "nic-backend-dev-infratodo"
    resource_group = "rg-dev-infranew"
    location       = "Canada Central"
    vm_name        = "vm-backend-dev-infratodo"
    vnet_name      = "vnet-dev-infratodo"
    snet_name       = "subnet2-dev-infratodo"
    pip_name       = "pip-backend-dev-infratodo"
    size           = "Standard_B2s"

    admin_username = "shikhaaryan"
    admin_password = "Azuredevops@"

   #  publisher_image = "Canonical"
#     offer_image     = "UbuntuServer"
#     sku_image       = "18_04-lts-gen2"
#     version_image   = "latest"

publisher_image = "Canonical"
offer_image    = "0001-com-ubuntu-server-jammy"
sku_image       = "22_04-lts-gen2"
version_image  = "latest

    kv_name     = "imaxkey"
    secret_name = "imaxadmin"
  }
}

key_vaults = {
  kv1new = {
    kv_name        = "imaxkey"
    location       = "Canada Central"
    resource_group = "rg-dev-infranew"
  }
}

secrets = {
  vm_user = {
    resource_group = "rg-dev-infranew"
    secret_name    = "imaxadmin"
    value          = "shikhaaryan"
    kv_name        = "imaxkey"
  }

  vm_psw = {
    resource_group = "rg-dev-infranew"
    secret_name    = "imaxpass"
    value          = "Adminpas@2025$"
    kv_name        = "imaxkey"
    
  }

}
