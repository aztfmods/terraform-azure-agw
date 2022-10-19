output "agw" {
  value = azurerm_application_gateway.application_gateway
}

output "merged_ids" {
  value = concat(values(azurerm_public_ip.pip)[*].id, values(azurerm_key_vault.kv)[*].id, azurerm_application_gateway.application_gateway.id)
}