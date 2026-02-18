
# dummy address for holding DO NOT REMOVE  THIS ADDRESS IS POPULATE IN ADDRGRP as seed

resource "fortios_firewall_address" "DUMMY" {

  name   = "DUMMY"
  
  subnet = "169.254.255.255/32"
  
  comment = " DO NOT DELETE  "
  

}


#

locals {
  addresses = {
    "HomeNetwork"     = { subnet = "192.168.1.0 255.255.255.0",   comment = "HQ TERRAFORM ${local.current_date} " }
    "Branch1_Network" = { subnet = "10.1.0.0 255.255.255.0",  comment = "Branch 1" }
    "Branch2_Network" = { subnet = "10.2.0.0 255.255.255.0",  comment = "Branch 2" }
    "Branch3_Network" = { subnet = "10.3.0.0 255.255.255.0",  comment = "Branch 3" }
    "Branch4_Network" = { subnet = "10.4.0.0 255.255.255.0",  comment = "Branch 4" }
    "Branch5_Network" = { subnet = "10.5.0.0 255.255.255.0",  comment = "Branch 5" }
  }
}

resource "fortios_firewall_address" "multi" {
  for_each = local.addresses

  name    = each.key
  type    = "ipmask"
  subnet  = each.value.subnet
  comment = each.value.comment
}

#----------------------------

resource "fortios_firewall_address" "Bdumbaddress2" {

  name   = "Bdumbaaddress2"

  subnet = "169.254.68.67/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


resource "fortios_firewall_address" "Bdumbaddress3" {

  name   = "Bdumbaaddress3"

  subnet = "169.254.68.7/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


resource "fortios_firewall_address" "Bdumbaddress4" {

  name   = "Dbumbaddress4-${count.index}"
  
  count = 3 

  subnet = "169.254.68.7/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


resource "fortios_firewall_address" "Bdumbaddress33" {

  depends_on  =  [fortios_firewall_address.Bdumbaddress3]

  name   = "Bdumbaaddress33"

  subnet = "169.254.68.97/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


resource "fortios_firewall_address" "Bdumbaddress99" {

  name   = "Bdumbaaddres99"

  subnet = "169.254.68.99/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


resource "fortios_firewall_address" "Bdumbaddress98" {

  depends_on  =  [fortios_firewall_address.Bdumbaddress99]

  name   = "Bdumbaaddress98"

  subnet = "169.254.68.98/32"

  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "

}


#

