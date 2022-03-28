# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_ext_fc_storage_policy" "this" {
  name                    = var.name
  description             = var.description

  admin_state   = var.admin_state

  exta_traffic {
    name        = var.exta_traffic.name
    vsan_id     = var.exta_traffic.vsan_id
    # object_type = "replication.NamedVsan"
  }

  extb_traffic {
    name        = var.extb_traffic.name
    vsan_id     = var.extb_traffic.vsan_id
    # object_type = "replication.NamedVsan"
  }

  wwxn_prefix_range {
    end_addr    = var.wwxn_prefix_range.end_addr
    start_addr  = var.wwxn_prefix_range.start_addr
    # object_type = "hyperflex.WwxnPrefixRange"
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
