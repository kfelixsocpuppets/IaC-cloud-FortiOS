#
#
locals {
 # It's good practice to TS the policy up in UTC or LocalTZ 
  current_date = formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())
}
