resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "koreasouth"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    vm_size               = "Standard_D2_v3"
     network_interface_ids = ["${azurerm_network_interface.mysqlnic.id}"]


    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
 	admin_password = "SKCNC!23"   
}

 os_profile_linux_config {
    disable_password_authentication = false
  }

    tags = {
        environment = "Terraform Team 3"
    }
}
