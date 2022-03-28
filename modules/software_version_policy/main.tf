# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_software_version_policy" "this" {
  name                    = var.name
  description             = var.description
  server_firmware_version = var.server_firmware_version
  hypervisor_version      = var.hypervisor_version
  hxdp_version            = var.hxdp_version

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
