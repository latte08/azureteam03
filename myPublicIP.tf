resource  "azurerm_public_ip" "myterraformpublicip" {
	name = "team3PublicIP"
	location = "koreasouth"
	resource_group_name          = "${azurerm_resource_group.myterraformgroup.name}"
	allocation_method	="Static"

	tags = {
		environment = "Terraform Team 3"
}
}



resource  "azurerm_public_ip" "myterraformpublicip2" {
        name = "team3PublicIP2"
        location = "koreasouth"
        resource_group_name          = "${azurerm_resource_group.myterraformgroup.name}"
        allocation_method       ="Static"

        tags = {
                environment = "Terraform Team 3"
}
}

