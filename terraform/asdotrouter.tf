resource "fortios_router_bgp" "AS5706" {
  # set  the AS# asot format
  as_string  = 0.5706
  holdtime_timer                     = 90
  keepalive_timer                    = 45 
  log_neighbour_changes              = "enable"

  redistribute {
    name   = "connected"
    status = "enable"
  }
# redistribute static/ospf/connected

 
  redistribute {
    name   = "ospf"
    status = "enable"
  }
  redistribute {
    name   = "static"
    status = "enable"
  }
}
