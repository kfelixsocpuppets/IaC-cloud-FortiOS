resource "null_resource" "timestamp_create" {
  triggers = {
    address_name = local.address_name
  }

  provisioner "local-exec" {
    command = "date -u +\"%Y-%m-%dT%H:%M:%SZ\" > ${path.module}/${local.address_name}_created.txt"
  }
}


locals {
  address_name = "web-prod-west"
}


data "local_file" "address_created_at" {
  filename   = "${path.module}/${local.address_name}_created.txt"
  depends_on = [null_resource.timestamp_create]
}



locals {
  hosts = {
    "web01_W" = { ip = "10.0.1.11/32", tags = ["prod", "web", "WEST" ]  }
    "web02_W" = { ip = "10.0.1.12/32", tags = ["prod", "web", "WEST" ]  }
    "web03_W" = { ip = "10.0.1.13/32", tags = ["prod", "web", "WEST" ]  }
    "web04_W" = { ip = "10.0.1.14/32", tags = ["prod", "web", "WEST" ]  }
    "web05_W" = { ip = "10.0.1.15/32", tags = ["prod", "web", "WEST" ]  }
    "web01_E" = { ip = "10.0.2.11/32", tags = ["prod", "web", "EAST" ]  }
    "web02_E" = { ip = "10.0.2.12/32", tags = ["prod", "web", "EAST" ]  }
  }

  prod_hosts_west = [for name, attrs in local.hosts : name if contains(attrs.tags, "WEST")]
  prod_hosts_east = [for name, attrs in local.hosts : name if contains(attrs.tags, "EAST")]
}

resource "fortios_firewall_address" "hosts" {
  for_each = local.hosts
  name     = each.key
  type     = "ipmask"
  subnet   = each.value.ip
}

#----build out dynamic addressgroup based off tag WEST | EAST

resource "fortios_firewall_addrgrp" "prod01" {
  name = "group_prod01"
  
  comment = "Created: ${trimspace(data.local_file.address_created_at.content)} | Managed by Terraform"

  lifecycle {
    ignore_changes = [comment]
  }

  depends_on = [null_resource.timestamp_create]


  dynamic "member" {
    for_each = local.prod_hosts_west
    content {
      name = member.value
    }
  }
}


resource "fortios_firewall_addrgrp" "prod02" {
  name = "group_prod02"

  comment = "Created: ${trimspace(data.local_file.address_created_at.content)} | Managed by Terraform"

  lifecycle {
    ignore_changes = [comment]
  }

  depends_on = [null_resource.timestamp_create]


  dynamic "member" {
    for_each = local.prod_hosts_east
    content {
      name = member.value
    }
  }
}

