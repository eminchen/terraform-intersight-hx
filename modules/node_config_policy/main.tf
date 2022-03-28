# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_node_config_policy" "this" {
  name                    = var.name
  description             = var.description

  # node_name_prefix = var.node_name_prefix

  dynamic "data_ip_range" {
    # OPTIONAL - The range of storage data IPs to be assigned to the nodes.
    for_each = var.data_ip_range == null ? [] : [var.data_ip_range]
    content {
      end_addr    = data_ip_range.value.end_addr
      gateway     = data_ip_range.value.gateway
      netmask     = data_ip_range.value.netmask
      start_addr  = data_ip_range.value.start_addr
    }
  }

  hxdp_ip_range {
    # The range of storage management IPs to be assigned to the nodes.
    end_addr = var.hxdp_ip_range.end_addr
    gateway = var.hxdp_ip_range.gateway
    netmask = var.hxdp_ip_range.netmask
    start_addr = var.hxdp_ip_range.start_addr
  }

  ## IWE Only ##
  dynamic "hypervisor_control_ip_range" {
    # The range of IPs to be assigned to each hypervisor node for VM migration and hypervior control.
    for_each = var.hypervisor_control_ip_range == null ? [] : [var.hypervisor_control_ip_range]
    content {
      end_addr = hypervisor_control_ip_range.value.end_addr
      gateway = hypervisor_control_ip_range.value.gateway
      netmask = hypervisor_control_ip_range.value.netmask
      start_addr = hypervisor_control_ip_range.value.start_addr
    }
  }

  mgmt_ip_range {
    # The range of management IPs to be assigned to the nodes.
    end_addr = var.mgmt_ip_range.end_addr
    gateway = var.mgmt_ip_range.gateway
    netmask = var.mgmt_ip_range.netmask
    start_addr = var.mgmt_ip_range.start_addr
  }

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
