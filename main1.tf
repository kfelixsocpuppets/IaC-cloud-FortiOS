terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}


# Configure the FortiOS Provider
provider "fortios" {
hostname = "xx.xxx.xx.xx"
token = "hsNr5qt6dgj7Nfh3Ggynq6z1NGpz"
insecure     = "true"
}


resource "fortios_system_admin_profiles" "scopups" {
  name                  = "socpupps"
  scope                 = "vdom"
  comments              = " https://socpuppet.blogspot.com/ "
  secfabgrp             = "read-write"
  ftviewgrp             = "read"
  authgrp               = "none"
  sysgrp                = "read"
  netgrp                = "none"
  loggrp                = "none"
  fwgrp                 = "none"
  vpngrp                = "none"
  utmgrp                = "none"
  wanoptgrp             = "none"
  wifi                  = "none"
  admintimeout_override = "disable"
}



resource "fortios_system_admin" "socketadmin" {
  name = "socketadmin"
  password = "123456789"        
  accprofile = "readonly"     
  vdom {
    name = "root"
  }
  # trusthost1 = "192.168.1.99"
}


resource "fortios_system_admin" "custA" {
  name = "custA"
  password = "password"      
  accprofile = "readonly"   
  vdom {
    name = "custA"
  }
  # trusthost1 = "192.168.1.99"
}



resource "fortios_system_admin" "custB" {
  name = "custB"
  password = "password"    
  accprofile = "super_admin"       
  vdom {
    name = "custA"
  }
  # trusthost1 = "192.168.1.99"
}
