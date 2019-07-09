resource "azurerm_virtual_network" "myterraformnetwork" {
	name = "Team03Vnet"
	address_space = ["3.0.0.0/16"]
	location = "koreasouth"
	resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

	tags = {
		environemnt = "Terraform Team 3"
	}
}
