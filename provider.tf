terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
   }
}


# Configure the FortiOS Provider
provider "fortios" {
hostname = var.hostname_value 
token =  var.token
insecure = "true"
}
