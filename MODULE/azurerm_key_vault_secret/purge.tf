resource "null_resource" "purge_deleted_secrets" {
  for_each = var.secret

  provisioner "local-exec" {
    # command = "az keyvault secret purge --name ${each.value.secret_name} --vault-name ${each.value.keyvault_name} || true"
    # command = "az keyvault secret purge --name ${each.value.secret_name} --vault-name ${each.value.keyvault_name}; exit 0"
    command = "powershell -Command \"try { az keyvault secret purge --name ${each.value.secret_name} --vault-name ${each.value.keyvault_name} } catch { Write-Host 'Secret not found or already purged' }\""
  }

  triggers = {
    secret_name   = each.value.secret_name
    keyvault_name = each.value.keyvault_name
  }
}
