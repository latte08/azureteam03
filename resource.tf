resource "azurerm_resource_group" "myterraformgroup" {
	name = "Group03RG"
	location = "koreasouth"
	
tags = {
		environment = "Terraform Team 3"
	}
}
