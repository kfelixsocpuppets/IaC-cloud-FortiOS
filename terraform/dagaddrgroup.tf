resource "null_resource" "timestamp_create" {
  triggers = {
    address_name = local.address_name
  }

  provisioner "local-exec" {
    command = "date -u +\"%Y-%m-%dT%H:%M:%SZ\" > ${path.module}/${local.address_name}_created.txt"
  }
}


# prod webservers located in the WEST region
#
#
locals {
  address_name = "web-prod-west"
}


data "local_file" "address_created_at" {
  filename   = "${path.module}/${local.address_name}_created.txt"
  depends_on = [null_resource.timestamp_create]
}



locals {
  hosts = {
    "web01" = { ip = "10.0.1.11/32", tags = ["prod", "web", "WEST" ]  }
    "web02" = { ip = "10.0.1.12/32", tags = ["prod", "web", "WEST" ]  }
    "web03" = { ip = "10.0.2.13/32", tags = ["prod", "web", "WEST" ]  }
    "web04" = { ip = "10.0.2.14/32", tags = ["prod", "web", "WEST" ]  }
  }

  prod_hosts = [for name, attrs in local.hosts : name if contains(attrs.tags, "prod")]
}

resource "fortios_firewall_address" "hosts" {
  for_each = local.hosts
  name     = each.key
  type     = "ipmask"
  subnet   = each.value.ip
}

resource "fortios_firewall_addrgrp" "prod01" {
  name = "group_prod01"
  
  comment = "Created: ${trimspace(data.local_file.address_created_at.content)} | Managed by Terraform"

  lifecycle {
    ignore_changes = [comment]
  }

  depends_on = [null_resource.timestamp_create]


  dynamic "member" {
    for_each = local.prod_hosts
    content {
      name = member.value
    }
  }
}
