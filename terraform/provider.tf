terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
   }
}



# Configure the FortiOS Provider Histname and Token are variables
provider "fortios" {
hostname = var.hostname_value 
token =  var.token
insecure = "true"
}
