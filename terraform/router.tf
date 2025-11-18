resource "fortios_router_bgp" "AS5706" {
  # set  the AS#
  as_string  = 5706
  holdtime_timer                     = 90
  keepalive_timer                    = 45 
  log_neighbour_changes              = "enable"

  redistribute {
    name   = "connected"
    status = "enable"
  }
  redistribute {
    name   = "rip"
    status = "disable"
  }
  redistribute {
    name   = "ospf"
    status = "enable"
  }
  redistribute {
    name   = "static"
    status = "enable"
  }
}
