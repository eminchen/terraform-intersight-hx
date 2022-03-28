# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_sys_config_policy" "this" {
  name                    = var.name
  description             = var.description

  dns_domain_name = var.dns_domain_name
  dns_servers     = var.dns_servers
  ntp_servers     = var.ntp_servers
  timezone        = var.timezone

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
