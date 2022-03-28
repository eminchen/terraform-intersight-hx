# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_ucsm_config_policy" "this" {
  name                    = var.name
  description             = var.description

  server_firmware_version = var.server_firmware_version

  kvm_ip_range {
    # The Out-of-band KVM IP range.Configures the service profiles to use IP addresses within this range for setting the KVM IP of a server.
    end_addr    = var.kvm_ip_range.end_addr
    gateway     = var.kvm_ip_range.gateway
    netmask     = var.kvm_ip_range.netmask
    start_addr  = var.kvm_ip_range.start_addr
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
