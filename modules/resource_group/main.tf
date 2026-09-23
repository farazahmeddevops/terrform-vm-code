resource "azurerm_resource_group" "rgs" {
  for_each = var.rgs

  name     = each.value.name
  location = each.value.location
  tags = {
    environment = each.value.environment
  }
 # lifecycle {
  #  prevent_destroy = true
  #}
} 