resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "East US"
  tags = {
    environment = "management"
    purpose     = "terraform-state"
    managed_by  = "terraform"

  }
  lifecycle {
    prevent_destroy = true

  }
}
resource "azurerm_storage_account" "tfstate" {
  name                     = "sttfaraz2026"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true

  }
}


resource "azurerm_storage_container" "tfstate" {
  name               = "tfstate"
  storage_account_id = azurerm_storage_account.tfstate.id
  lifecycle {
    prevent_destroy = true

  }
  depends_on = [azurerm_storage_account.tfstate]




}


