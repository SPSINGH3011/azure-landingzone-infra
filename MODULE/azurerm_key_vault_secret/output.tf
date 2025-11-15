output "secret" {
  value = { for secret, sec in azurerm_key_vault_secret.secret : secret => sec.id }
}
