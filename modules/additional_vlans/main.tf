# {
#     "RegisteredDevice": {
#         "Moid": "623423ae6f72612d31494286",
#         "ObjectType": "asset.DeviceRegistration"
#     },
#     "Name": "test-108",
#     "Description": "Test",
#     "Mtu": 1500,
#     "Vswitch": "vm",
#     "NetworkType": "L2",
#     "Vlan": 108
# }

# data "intersight_asset_device_registration" "this" {
#   ## Find assetDeviceRegistration for IWE cluster
#   platform_type = "IWE"
# }

data "intersight_virtualization_iwe_cluster" "this" {
  ## Cluster Details - NOT Profile Details
  cluster_name = var.cluster_name
}

resource "intersight_virtualization_virtual_network" "this" {
  name                    = lower(var.name)
  description             = var.description # default
  infra_network           = var.infra_network == null ? false : var.infra_network # default
  mtu                     = var.mtu == null ? 1500 : var.mtu #var.mtu # default
  network_type            = var.network_type == null ? "L2" : var.network_type # default
  trunk                   = var.trunk # default
  vlan                    = var.vlan_id
  vswitch                 = var.vswitch == null ? "vm" : var.vswitch # default
  wait_for_completion     = var.wait_for_completion # default

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  registered_device {
    moid = data.intersight_virtualization_iwe_cluster.this.results[0].registered_device[0].moid #"623423ae6f72612d31494286"
    object_type = "asset.DeviceRegistration"
  }

}
