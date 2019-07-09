resource "azurerm_network_interface" "myterraformnic" {
	name	=	"team03NIC"
	location	=	"koreasouth"
	resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
	network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

	ip_configuration {
	name	= "myNicConfiguration"
	subnet_id	=	"${azurerm_subnet.myterraformsubnetA.id}"
	private_ip_address_allocation = "Dynamic"
	public_ip_address_id	=	"${azurerm_public_ip.myterraformpublicip.id}"
}

tags = {
	environment = "Terraform Team 3"
}
}


resource "azurerm_network_interface" "mysqlnic" {
        name    =       "team03NIC2"
        location        =       "koreasouth"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
        network_security_group_id = "${azurerm_network_security_group.myterraformnsg2.id}"

        ip_configuration {
        name    = "myNicConfiguration2"
        subnet_id       =       "${azurerm_subnet.myterraformsubnetB.id}"
        private_ip_address_allocation = "Dynamic"
        
}

tags = {
        environment = "Terraform Team 3"
}
}



