# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_auto_support_policy" "this" {
  name                    = var.name
  description             = var.description

  admin_state = var.admin_state
  service_ticket_receipient = var.service_ticket_receipient

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
