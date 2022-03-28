# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_cluster_network_policy" "this" {
  name                    = var.name
  description             = var.description

  jumbo_frame = var.jumbo_frame
  uplink_speed = var.uplink_speed

  kvm_ip_range {
    end_addr   = var.kvm_ip_range.end_addr
    start_addr = var.kvm_ip_range.start_addr
    netmask    = var.kvm_ip_range.netmask
    gateway    = var.kvm_ip_range.gateway
  }

  # mac_prefix_range {
  #   end_addr   = var.mac_prefix_range.end_addr
  #   start_addr = var.mac_prefix_range.start_addr
  # }

  mgmt_vlan {
    name    = var.mgmt_vlan.name
    vlan_id = var.mgmt_vlan.vlan_id
  }

  vm_migration_vlan {
    name    = var.vm_migration_vlan.name
    vlan_id = var.vm_migration_vlan.vlan_id
  }

  vm_network_vlans = var.vm_network_vlans

  organization {
    # object_type = "organization.Organization"
    moid = data.intersight_organization_organization.this.results.0.moid
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
