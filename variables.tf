# variables.tf

# all variables should be defined in a variable.tf

variable "hostname_value" {
  description = "The desired hostname for the specifc resource"
  type        = string
}


variable "token" {
  description = "The desired API-token  for the specifc resource"
  type        = string
}

