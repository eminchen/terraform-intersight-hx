# # Looking up Organization MOID
# data "intersight_organization_organization" "this" {
#   name = var.organization
# }

# Lookup hyperflex cluster details
data "intersight_hyperflex_cluster_profile" "this" {
  moid  = var.cluster_moid
}

# Lookup compute server details
data "intersight_compute_physical_summary" "this" {
  serial  = var.serial_number
}

locals {
  netmask2cidr = {
    "0.0.0.0"         = "0"
    "128.0.0.0"       = "1"
    "192.0.0.0"       = "2"
    "224.0.0.0"       = "3"
    "240.0.0.0"       = "4"
    "248.0.0.0"       = "5"
    "252.0.0.0"       = "6"
    "254.0.0.0"       = "7"
    "255.0.0.0"       = "8"
    "255.128.0.0"     = "9"
    "255.192.0.0"     = "10"
    "255.224.0.0"     = "11"
    "255.240.0.0"     = "12"
    "255.248.0.0"     = "13"
    "255.252.0.0"     = "14"
    "255.254.0.0"     = "15"
    "255.255.0.0"     = "16"
    "255.255.128.0"   = "17"
    "255.255.192.0"   = "18"
    "255.255.224.0"   = "19"
    "255.255.240.0"   = "20"
    "255.255.248.0"   = "21"
    "255.255.252.0"   = "22"
    "255.255.254.0"   = "23"
    "255.255.255.0"   = "24"
    "255.255.255.128" = "25"
    "255.255.255.192" = "26"
    "255.255.255.224" = "27"
    "255.255.255.240" = "28"
    "255.255.255.248" = "29"
    "255.255.255.250" = "30"
    "255.255.255.252" = "31"
    "255.255.255.255" = "32"
  }
  # data_ip_range = data.intersight_hyperflex_cluster_profile.this.results[0].data_ip_range # not working?
  # data_ip_start_addr = regex(local.data_ip_range.start_addr
  # data_cidr = format("%s/%")

  # hxdp_data_ip = var.hxdp_data_ip == null ? (local.data_ip_range.start_addr) : var.hxdp_data_ip
}

# Create an HX node profile
resource "intersight_hyperflex_node_profile" "this" {
  name                    = var.name
  description             = var.description

  hxdp_data_ip            = var.hxdp_data_ip
  hxdp_mgmt_ip            = var.hxdp_mgmt_ip
  hxdp_storage_client_ip  = var.hxdp_storage_client_ip

  hypervisor_control_ip   = var.hypervisor_control_ip
  hypervisor_data_ip      = var.hypervisor_data_ip
  hypervisor_mgmt_ip      = var.hypervisor_mgmt_ip

  assigned_server {
    moid = data.intersight_compute_physical_summary.this.results[0].moid
    object_type = "compute.RackUnit"
  }

  cluster_profile {
    moid = var.cluster_moid
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to IP address as Intersight will set these if not defined
      hxdp_data_ip,
      hxdp_mgmt_ip,
      hxdp_storage_client_ip,
      hypervisor_control_ip,
      hypervisor_data_ip,
      hypervisor_mgmt_ip
    ]
  }
}
