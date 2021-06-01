output "ids" {
    value = {for group,id in azurerm_ip_group.ip_group: group=> id.id}
}