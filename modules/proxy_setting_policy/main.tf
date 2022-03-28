# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_proxy_setting_policy" "this" {
  name                    = var.name
  description             = var.description

  hostname  = var.hostname
  password  = var.password
  port      = var.port
  username  = var.username

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
