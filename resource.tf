resource "azurerm_ip_group" "ip_group" {
  for_each = var.ip_groups
  name                = each.key
  location            = var.location
  resource_group_name = var.rg_name
  cidrs               = each.value
}