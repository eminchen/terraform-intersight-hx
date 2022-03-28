# Looking up Organization MOID
data "intersight_organization_organization" "this" {
  name = var.organization
}

# Creating cluster profile
resource "intersight_hyperflex_cluster_profile" "this" {
  name                          = var.name
  description                   = var.description

  action                        = var.action
  wait_for_completion           = var.wait_for_completion # Bool?

  data_ip_address               = var.data_ip_address
  host_name_prefix              = var.host_name_prefix
  hypervisor_control_ip_address = var.hypervisor_control_ip_address
  hypervisor_type               = var.hypervisor_type
  mac_address_prefix            = var.mac_address_prefix
  mgmt_ip_address               = var.mgmt_ip_address
  mgmt_platform                 = var.mgmt_platform
  replication                   = var.replication
  storage_cluster_auxiliary_ip  = var.storage_cluster_auxiliary_ip #?
  storage_type                  = var.storage_type
  wwxn_prefix                   = var.wwxn_prefix #?

  ## IWE Only ##
  storage_client_ip_address     = var.storage_client_vlan.ip_address
  storage_client_netmask        = var.storage_client_vlan.netmask


  dynamic "auto_support" {
    for_each = var.auto_support_policy_moid == null ? [] : [var.auto_support_policy_moid]
    content {
      moid = auto_support.value
    }
  }

  ## IWE Only ##
  dynamic "cluster_internal_subnet" {
    for_each = var.hypervisor_type == "IWE" ? [var.cluster_internal_subnet] : []
    content {
      gateway     = cluster_internal_subnet.value.gateway
      ip_address  = cluster_internal_subnet.value.ip_address
      netmask     = cluster_internal_subnet.value.netmask
    }
  }

  cluster_network {
    moid = var.cluster_network_policy_moid
  }

  dynamic "cluster_storage" {
    for_each = var.cluster_storage_policy_moid == null ? [] : [var.cluster_storage_policy_moid]
    content {
      moid = cluster_storage.value
    }
  }

  dynamic "ext_fc_storage" {
    for_each = var.ext_fc_storage_policy_moid == null ? [] : [var.ext_fc_storage_policy_moid]
    content {
      moid = ext_fc_storage.value
    }
  }

  dynamic "ext_iscsi_storage" {
    for_each = var.ext_iscsi_storage_policy_moid == null ? [] : [var.ext_iscsi_storage_policy_moid]
    content {
      moid = ext_iscsi_storage.value
    }
  }

  local_credential {
    moid = var.local_cred_policy_moid
  }

  node_config {
    moid = var.node_config_policy_moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.this.results.0.moid
  }

  dynamic "proxy_setting" {
    for_each = var.proxy_setting_policy_moid == null ? [] : [var.proxy_setting_policy_moid]
    content {
      moid = proxy_setting_policy_moid.value
    }
  }

  software_version {
    moid = var.software_version_policy_moid
  }

  ## IWE Only ##
  dynamic "storage_client_vlan" {
    for_each = var.hypervisor_type == "IWE" ? [var.storage_client_vlan] : []
    content {
      name     = storage_client_vlan.value.name
      vlan_id  = storage_client_vlan.value.vlan_id
    }
  }

  storage_data_vlan {
    name    = var.storage_data_vlan.name
    vlan_id = var.storage_data_vlan.vlan_id
  }

  sys_config {
    moid = var.sys_config_policy_moid
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "vcenter_config" {
    for_each = var.vcenter_config_policy_moid == null ? [] : [var.vcenter_config_policy_moid]
    content {
      moid = vcenter_config.value
    }
  }

  dynamic "ucsm_config" {
    for_each = var.ucsm_config_policy_moid == null ? [] : [var.ucsm_config_policy_moid]
    content {
      moid = ucsm_config.value
    }
  }

}
