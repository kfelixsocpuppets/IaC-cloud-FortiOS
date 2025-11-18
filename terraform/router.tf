resource "fortios_router_bgp" "AS5706" {
  #as                                 = "5706"
  as_string  = 5709
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
