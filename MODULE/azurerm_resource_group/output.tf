
#for  id output of resource group IDs
output "rg-id" {
  value = { for resource_groups , rg in azurerm_resource_group.rg : resource_groups => rg.id }
}

###for all outputs of resource group IDs
# output "rg-id" {
#   value = azurerm_resource_group.rg
# }



#“For Expression” { =>}

# It’s officially known as a
# “For Expression” or “For Loop Expression”
# This is a for expression in Terraform used to loop over all created resource groups and collect their IDs.
# #In { for rg, u in azurerm_resource_group.rg : rg => u.id },

# rg = key (name like dev, prod)

# u = that RG’s object

# u.id = that RG’s ID property
# Terraform loops through all RGs and builds a map of RG name → RG ID.

#============>
# rg => u.id
# means:

# For each RG, take the key (rg) and map it to that RG’s ID (which is inside u).

# So Terraform builds a map like:

# {
#   "dev"  = u.id  (means azurerm_resource_group.rg["dev"].id)
#   "prod" = u.id  (means azurerm_resource_group.rg["prod"].id)
# }