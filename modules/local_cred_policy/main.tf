# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_local_credential_policy" "this" {
  name                        = var.name
  hxdp_root_pwd               = var.hxdp_root_pwd
  hypervisor_admin            = var.hypervisor_admin # "admin"
  hypervisor_admin_pwd        = var.hypervisor_admin_pwd
  factory_hypervisor_password = var.factory_hypervisor_password # Bool - false

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
