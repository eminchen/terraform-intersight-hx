terraform {
  # NOTE: Remove the 'backend' section for locally run Terraform plans with no remote state management.  This is not recommended.
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "mel-ciscolabs-com"
    workspaces {
      name = "iwe-hyperflex"
    }
  }
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      # version = "1.0.12"
    }
  }
}

### COMMON PROVIDERS ###
provider "intersight" {
  # Configuration options
  apikey    = var.intersight_key
  secretkey = var.intersight_secret
  endpoint =  var.intersight_url
}

### HYPERFLEX CLUSTER PROVISIONING MODULE ###
module "hx" {
  source  = "cisco-apjc-cloud-se/hx/intersight"
  version = "1.0.2"

  ### COMMON SETTINGS ###
  action              = "No-op" # Validate, Deploy, Continue, Retry, Abort, Unassign, No-op
  wait_for_completion = false
  organization        = "default"
  tags                = []

  ### HYPERFLEX CLUSTER SETTINGS ###
  cluster = {
    name                          = "TF-HX-IWE"
    description                   = "HX Cluster deployed by Terrafrom"
    hypervisor_control_ip_address = "172.31.255.2"
    hypervisor_type               = "IWE" # ESXi, IWE
    mac_address_prefix            = "00:25:B5:00"
    mgmt_ip_address               = "10.67.53.226"
    mgmt_platform                 = "FI" # FI, EDGE
    replication                   = 3
    host_name_prefix              = "tf-hx-svr" # Must be lowercase

    storage_data_vlan = {
      name    = "HX-STR-DATA-103"
      vlan_id = 103
      }

    ### IWE HYPERVISOR ONLY CLUSTER SETTINGS ###
    storage_client_vlan = {
      name        = "HX-STR-CLIENT-104"
      vlan_id     = 104
      ip_address  = "169.254.240.1"
      netmask     = "255.255.248.0" # 255.255.248.0 hard set!
      }
    cluster_internal_subnet = {
      gateway                     = "192.168.0.1"
      ip_address                  = "192.168.0.0"
      netmask                     = "255.255.0.0"
      }

    }

  ### ASSIGNED NODES (SERVERS) ###
  nodes = {
    WZP23470VYT = {
      cluster_index = 1
    }
    WZP23470VYJ = {
      cluster_index = 2
    }
    WZP23470VYE = {
      cluster_index = 3
    }
  }

  ### ASSOCIATED POLICIES ###

  local_cred_policy = {
    ## NOTE: Passwords have been defined as TFCB workspace variables. No passwords stored here.
    use_existing  = false
    name          = "tf-hx-iwe-security-policy"
    hxdp_root_pwd               = var.hxdp_root_pwd
    hypervisor_admin            = "iweadmin"
    hypervisor_admin_pwd        = var.hypervisor_admin_pwd
    factory_hypervisor_password = true
  }

  sys_config_policy = {
    use_existing  = true
    name          = "mel-dc4-hx1-sys-config-policy"
  }

  auto_support_policy = {
    use_existing  = true
    name          = "mel-dc4-hx1-auto-support-policy"
  }

  node_config_policy = {
    use_existing      = false
    name              = "tf-hx-iwe-cluster-node-config-policy"
    description       = "HX IWE Cluster Network Policy built from Terraform"
    ### HYPERVISOR MANAGMENT IPs ###
    mgmt_ip_range = {
      start_addr  = "10.67.53.227"
      end_addr    = "10.67.53.230"
      gateway     = "10.67.53.225"
      netmask     = "255.255.255.224"
    }
    ### HYPERFLEX STORAGE CONTROLLER MANAGMENT IPs ###
    hxdp_ip_range = {
      start_addr  = "10.67.53.231"
      end_addr    = "10.67.53.234"
      gateway     = "10.67.53.225"
      netmask     = "255.255.255.224"
      }
    ### (IWE ONLY) HYPERVISOR CLUSTER CONTROL NETWORK IPs ###
    hypervisor_control_ip_range = {
      start_addr  = "172.31.255.10"
      end_addr    = "172.31.255.255"
      gateway     = "172.31.255.1"
      netmask     = "255.255.255.0"
      }
  }

  cluster_network_policy = {
    use_existing        = false
    name                = "tf-hx-iwe-cluster-network-policy"
    description         = "HX IWE Cluster Network Policy built from Terraform"
    jumbo_frame         = true
    uplink_speed        = "default"
    kvm_ip_range        = {
      start_addr  = "10.67.29.115"
      end_addr    = "10.67.29.118"
      netmask     = "255.255.255.0"
      gateway     = "10.67.29.1"
    }
    mgmt_vlan           = {
      name    = "HX-MGMT-107"
      vlan_id = 107
    }
    vm_migration_vlan   = {
      name    = "HX-HYPER-NET-105"
      vlan_id = 105
    }
    vm_network_vlans    = [
      # NOTE:
      # - Cluster Network Policy requires at least one VM Network to be defined as part of the initial cluster configuration.
      # - This policy is locked after deployment so additonal VLANs cannot be added here. For additional (i.e. Day 2) VLAN changes see the "additional_vm_network_vlans" variable below.
      # - The VLAN name will be converted to lower case if not below.
      {
        name    = "HX-VM-NET-106"
        vlan_id = 106
      }
    ]
  }

  software_version_policy = {
    use_existing            = false
    name                    = "tf-iwe-sw-version"
    description             = "HX IWE cluster software version policy created by Terraform"
    server_firmware_version = "4.2(1i)"
    hypervisor_version      = "1.2(1a)"
    hxdp_version            = "4.5(2b)"
  }

  ### ADDITIONAL (DAY 2) VM NETWORK VLANS ###
  # NOTE:
  # - The name will be converted to lower case if not below.
  additional_vm_network_vlans = [
    {
      name    = "test-108"
      vlan_id = 108
      description = "Additional VLAN created by Terraform post Deployment"
    }
  ]
}
