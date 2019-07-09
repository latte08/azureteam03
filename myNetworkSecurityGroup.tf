resource "azurerm_network_security_group" "myterraformnsg" {
	name = "myNetworkSecurityGroup"
	location = "koreasouth"
	resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

	security_rule {
	name = "SSH"
	priority	=	1001
	direction 	= "Inbound"
	access	=	"Allow"
	protocol	 = "Tcp"
	source_port_range 	=	"*"
	destination_port_range	=	"22"
	source_address_prefix	=	"*"
	destination_address_prefix	= 	"*"
}

security_rule {
        name = "HTTP"
        priority        =       2001
        direction       = "Inbound"
        access  =       "Allow"
        protocol         = "Tcp"
        source_port_range       =       "*"
	destination_port_range 	=	"80"
        source_address_prefix   =       "*"
        destination_address_prefix      =       "*"
}

tags    = {
         environment = "Terraform Team 3"
}



}



resource "azurerm_network_security_group" "myterraformnsg2" {
        name = "myNetworkSecurityGroup2"
        location = "koreasouth"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

        security_rule {
        name = "mySQL"
        priority        =       2001
        direction       = "Inbound"
        access  =       "Allow"
        protocol         = "Tcp"
        source_port_range       =       "80"
        destination_port_range  =       "3306"
        source_address_prefix   =       "*"
        destination_address_prefix      =       "*"
}

security_rule {
        name = "SSH"
        priority        =       1002
        direction       = "Inbound"
        access  =       "Allow"
        protocol         = "Tcp"
        source_port_range       =       "22"
        destination_port_range  =       "22"
        source_address_prefix   =       "*"
        destination_address_prefix      =       "*"
}
tags    = {
        environment = "Terraform Team 3"
}
}
