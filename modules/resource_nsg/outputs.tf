output "nsg_ids" {
  value = {
    for key, nsg in azurerm_network_security_group.axion_nsg :
    key => nsg.id
  }
}