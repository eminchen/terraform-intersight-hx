# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_vcenter_config_policy" "this" {
  name                    = var.name
  description             = var.description

  data_center = var.data_center
  hostname    = var.hostname
  password    = var.password
  sso_url     = var.sso_url
  username    = var.username

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
