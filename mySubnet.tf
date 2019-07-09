resource "azurerm_subnet" "myterraformsubnetA" {
	name	=	"03SubnetA"
	resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
	virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
	address_prefix	=	"3.0.1.0/24"
}

resource "azurerm_subnet" "myterraformsubnetB" {
	name    =       "03SubnetB"
        resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
        virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
        address_prefix  =       "3.0.2.0/24"

}

