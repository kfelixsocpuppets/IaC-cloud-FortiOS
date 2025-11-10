terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}


# Configure the FortiOS Provider
provider "fortios" {
hostname = "xx.xxx.xxx.xxx"
token = "hsNr5qt6dgj7Nfh3Ggynq6z1NGpz"
insecure     = "true"
}



# dummy address for holding DO NOT REMOVE 

resource "fortios_firewall_address" "dumbaddress" {

  name   = "dumbaddress"

  subnet = "169.254.66.66/32"

}



The code will create the new address and add it to the BLOCK_LIST groups



e.g



# dummy address for holding DO NOT REMOVE 

resource "fortios_firewall_address" "dumbaddress" {

  name   = "dumbaddress"

  subnet = "169.254.66.66/32"

}





resource "fortios_firewall_address" "address11" {

  name   = "address11"

  subnet = "192.168.1.1/32"

}





resource "fortios_firewall_address" "INC56666_1" {

  name   = "INC56666_1"

  subnet = "26.26.26.26/32"

}











resource "fortios_firewall_object_addressgroup" "BLOCK_LIST2" {

  name    = "BLOCK_LIST2"

  member  = ["dumbaddress","address11","INC56666_1"]



}





resource "fortios_firewall_object_addressgroup" "BLOCK_LIST" {

  name    = "BLOCK_LIST"

  member  = ["dumbaddress","TXDOT","HOST111","address11","address12","INC56666_1" ]




}

