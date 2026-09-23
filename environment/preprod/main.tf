module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  source = "../../modules/resource_virtual-network"
  vnets  = var.vnets
  depends_on = [
    module.resource_group
  ]
}
module "subnets" {
  source  = "../../modules/resource_subnet"
  subnets = var.subnets
  depends_on = [
    module.virtual_network
  ]
}
module "nsg" {
  source = "../../modules/resource_nsg"

  nsgs      = var.nsgs
  nsg_rules = var.nsg_rules
}

module "nsg_association" {
  source = "../../modules/resource_nsg_association"

  associations = {
    app = {
      subnet_id                 = module.subnets.subnet_ids["app"]
      network_security_group_id = module.nsg.nsg_ids["app"]
    }

    db = {
      subnet_id                 = module.subnets.subnet_ids["db"]
      network_security_group_id = module.nsg.nsg_ids["db"]
    }
  }

  depends_on = [
    module.subnets,
    module.nsg
  ]
}
# module "key_vault" {
#   source     = "../../modules/resource_key-vault"
#   key_vaults = var.key_vaults
#   depends_on = [
#     module.resource_group
#   ]
# }

module "vm" {
  source = "../../modules/resource_vm"

  vms = {
    for k, v in var.vms : k => merge(v, {
      subnet_id = module.subnets.subnet_ids[v.subnet_name]
    })
  }

  depends_on = [
    module.subnets
  ]
}