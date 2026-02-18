# dummy address for holding DO NOT REMOVE  THIS ADDRESS IS POPULATE IN ADDRGRP as seed

resource "fortios_firewall_address" "Adumbaddress" {

  name   = "Adumbaaddress"
  
  subnet = "169.254.68.66/32"
  
  comment = " Managed by TERRAFORMS BLOGGER ${local.current_date} DEMO "
  

}

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
