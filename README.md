# azure-landingzone-infra
Azure Landing Zone IaC repository using Terraform modules. Provides secure, scalable, and standardized cloud infrastructure for Dev, QA, and Prod environments as per enterprise best practices.
#Folder Structure -cmd /c tree . /f
AZURE-LANDINGZONE-INFRA
│   .gitignore
│   README.md
│   
├───ENV
│   ├───Dev
│   │   │   .terraform.lock.hcl
│   │   │   backend.tf
│   │   │   main.tf
│   │   │   nginx.sh
│   │   │   output.tf
│   │   │   provider.tf
│   │   │   terraform.tfstate
│   │   │   terraform.tfstate.backup
│   │   │   terraform.tfvars
│   │   │   variable.tf
│   │   │
│   │   └───.terraform
│   │       ├───modules
│   │       │       modules.json
│   │       │
│   │       └───providers
│   │           └───registry.terraform.io
│   │               └───hashicorp
│   │                   ├───azurerm
│   │                   │   └───4.52.0
│   │                   │       └───windows_amd64
│   │                   │               LICENSE.txt
│   │                   │               terraform-provider-azurerm_v4.52.0_x5.exe
│   │                   │
│   │                   └───null
│   │                       └───3.2.4
│   │                           └───windows_amd64
│   │                                   LICENSE.txt
│   │                                   terraform-provider-null_v3.2.4_x5.exe
│   │
│   ├───Prod
│   └───QA
├───MODULE
│   ├───azurerm_bastion_host
│   │       azurerm_bastion_host.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_key_vault
│   │       azurerm_key_vault.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_key_vault_secret
│   │       azurerm_key_vault_secret.tf
│   │       data.tf
│   │       output.tf
│   │       purge.tf
│   │       variable.tf
│   │
│   ├───azurerm_linux_virtual_machine
│   │       azurerm_linux_virtual_machine.tf
│   │       data.tf
│   │       nginx.sh
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_network_interface
│   │       azurerm_network_interface.tf
│   │       data.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_network_security_group
│   │       azurerm_network_security_group.tf
│   │       data.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_public_ip
│   │       azurerm_public_ip.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_resource_group
│   │       azurerm_resource_group.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_storage_account
│   │       azurerm_storage_account.tf
│   │       output.tf
│   │       variable.tf
│   │
│   ├───azurerm_virtual_network
│   │       azurerm_virtual_network.tf
│   │       output.tf
│   │       variable.tf
│   │
│   └───azurerm_windows_virtual_machine
│           azurerm_windows_virtual_machine.tf
│           output.tf
│           variable.tf
│
└───Pipelines
        dev.yaml
