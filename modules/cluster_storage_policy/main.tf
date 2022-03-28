# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

resource "intersight_hyperflex_cluster_storage_policy" "this" {
  name                    = var.name
  description             = var.description

  disk_partition_cleanup  = var.disk_partition_cleanup
  vdi_optimization        = var.vdi_optimization

  logical_avalability_zone_config {
    auto_config    = var.logical_avalability_zone_config.auto_config
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
