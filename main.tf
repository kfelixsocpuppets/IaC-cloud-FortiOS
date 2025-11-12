# dummy address for holding DO NOT REMOVE  THIS ADDRESS IS POPULATE IN ADDRGRP as seed

resource "fortios_firewall_address" "dumbass" {

  name   = "dumbass"

  subnet = "169.254.66.66/32"
  
  comment = " Managed by TERRAFORMS BLOGGER DEMO "

}

