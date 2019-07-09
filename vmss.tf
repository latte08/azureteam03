resource "azurerm_lb" "myterraformlb" {
 name                = "team03vmss-lb"
 location            = "koreasouth"
 resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

frontend_ip_configuration {
   name                 = "PublicIPAddress"	
   public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip2.id}"
}


 tags = {
	environment	= "Terraform Team 3"
}
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
 resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
 loadbalancer_id     = "${azurerm_lb.myterraformlb.id}"
 name                = "BackEndAddressPool03"
}

resource "azurerm_lb_probe" "myterraformlbprobe" {
 resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
 loadbalancer_id     = "${azurerm_lb.myterraformlb.id}"
 name                = "ssh-running-probe"
 port                = "${var.application_port}"
}

resource "azurerm_lb_rule" "lbnatrule" {
   resource_group_name            = "${azurerm_resource_group.myterraformgroup.name}"
   loadbalancer_id                = "${azurerm_lb.myterraformlb.id}"
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = "${var.application_port}"
   backend_port                   = "${var.application_port}"
   backend_address_pool_id        = "${azurerm_lb_backend_address_pool.bpepool.id}"
   frontend_ip_configuration_name = "PublicIPAddress"
   probe_id                       = "${azurerm_lb_probe.myterraformlbprobe.id}"
}

resource "azurerm_virtual_machine_scale_set" "vmss" {
 name                = "vmscaleset"
 location            = "koreasouth"
 resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"
 upgrade_policy_mode = "Manual"

 sku {
   name     = "Standard_D1_v2"
   tier     = "Standard"
   capacity = 5
 }

 storage_profile_image_reference {
   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"
 }

 storage_profile_os_disk {
   name              = ""
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }

 storage_profile_data_disk {
   lun          = 0
   caching        = "ReadWrite"
   create_option  = "Empty"
   disk_size_gb   = 10
 }

 os_profile {
   computer_name_prefix = "vmlab"
   admin_username       = "${var.admin_user}"
   admin_password       = "${var.admin_password}"
   custom_data          = "${file("web.conf")}"
 }

 os_profile_linux_config {
   disable_password_authentication = false
 }

 network_profile {
   name    = "terraformnetworkprofile"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = "${azurerm_subnet.myterraformsubnetA.id}"
     load_balancer_backend_address_pool_ids = ["${azurerm_lb_backend_address_pool.bpepool.id}"]
     primary = true
   }
 }

 tags = {
	environment	= "Terraform Team 3"
}
}
