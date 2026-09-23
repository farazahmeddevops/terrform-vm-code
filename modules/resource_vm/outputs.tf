output "vm_ids" {
  description = "IDs of the Linux virtual machines"

  value = {
    for key, vm in azurerm_linux_virtual_machine.vm :
    key => vm.id
  }
}
output "nic_ids" {
  description = "IDs of the network interfaces"

  value = {
    for key, nic in azurerm_network_interface.nic :
    key => nic.id
  }
}
output "public_ip_ids" {
  description = "IDs of the public IP addresses"

  value = {
    for key, pip in azurerm_public_ip.pip :
    key => pip.id
  }
}