# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "key_vaults" {
#   for_each                    = var.key_vaults
#   name                        = each.value.name
#   location                    = each.value.location
#   resource_group_name         = each.value.resource_group_name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   rbac_authorization_enabled  = true
#   soft_delete_retention_days  = 90
#   purge_protection_enabled    = true

#   tags = {
#     environment = each.value.environment
#   }
# }