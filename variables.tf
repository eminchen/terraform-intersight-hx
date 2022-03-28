### HyperFlex Profile Variables

variable "action" {
  type = string
  default = "No-op" # Validate, Deploy, Continue, Retry, Abort, Unassign, No-op
  description = "User initiated action. Each profile type has its own supported actions. For HyperFlex cluster profile, the supported actions are -- Validate, Deploy, Continue, Retry, Abort, Unassign"

  validation {
    condition = contains(["Validate", "Deploy", "Continue", "Retry", "Abort", "Unassign", "No-op"], var.action)
    error_message = "The action value must be one of Validate, Deploy, Continue, Retry, Abort, Unassign or No-op."
  }
}

variable "wait_for_completion" {
  type = bool
  default = false
}

variable "cluster_deployed" {
  type = bool
  default = false
  description = "Workaround to not deploy additional VLANs until this bool is set to true.  Should be set manually after HX IWE cluster deployment"
}

variable "tags" {
  type    = list(map(string))
  default = []
}

variable "organization" {
  type        = string
  description = "Organization Name"
  default     = "default"
}

variable "cluster" {
  type = object({
    name                          = string
    description                   = string
    data_ip_address               = optional(string)
    hypervisor_control_ip_address = string
    hypervisor_type               = string ## ESXi, IWE, HyperV
    mac_address_prefix            = string
    mgmt_ip_address               = string
    mgmt_platform                 = string ## EDGE, FI
    replication                   = number
    host_name_prefix              = string
    storage_data_vlan             = object({
      name    = string
      vlan_id = number
      })
    storage_cluster_auxiliary_ip  = optional(string)
    storage_type                  = optional(string)
    wwxn_prefix                   = optional(string)
    ## IWE ONLY ##
    storage_client_vlan           = optional(object({
      name       = string
      vlan_id    = number
      ip_address = optional(string)
      netmask    = optional(string)
      }))
    cluster_internal_subnet       = optional(object({
      gateway    = string
      ip_address = string
      netmask    = string
      }))
    })
}

variable "nodes" {
  ## Assumes serial number is the index
  type = map(object({
    cluster_index           = number
    hostname                = optional(string)
    hxdp_data_ip            = optional(string)
    hxdp_mgmt_ip            = optional(string)
    hxdp_storage_client_ip  = optional(string)
    hypervisor_control_ip   = optional(string)
    hypervisor_data_ip      = optional(string)
    hypervisor_mgmt_ip      = optional(string)
    }))
}

variable "local_cred_policy" {
  type = object({
    use_existing                = bool
    name                        = string
    factory_hypervisor_password = optional(bool)
    hxdp_root_pwd               = optional(string)
    hypervisor_admin            = optional(string) # admin
    hypervisor_admin_pwd        = optional(string)
  })
}

variable "sys_config_policy" {
  type = object({
    use_existing    = bool
    name            = string
    description     = optional(string)
    dns_domain_name = optional(string)
    dns_servers     = optional(list(string))
    ntp_servers     = optional(list(string))
    timezone        = optional(string)
  })
}

variable "vcenter_config_policy" {
  type = object({
    use_existing  = bool
    name          = string
    description   = optional(string)
    data_center   = optional(string)
    hostname      = optional(string)
    password      = optional(string)
    sso_url       = optional(string)
    username      = optional(string)
  })
  default = null
}

variable "cluster_storage_policy" {
  type = object({
    use_existing                    = bool
    name                            = string
    description                     = optional(string)
    disk_partition_cleanup          = optional(bool)
    vdi_optimization                = optional(bool)
    logical_avalability_zone_config = object({
      auto_config = optional(bool)
      })
  })
  default = null
}

variable "auto_support_policy" {
  type = object({
    use_existing              = bool
    name                      = string
    description               = optional(string)
    admin_state               = optional(bool)
    service_ticket_receipient = optional(string)
  })
  default = null
}

variable "node_config_policy" {
  type = object({
    use_existing     = bool
    name             = string
    description      = optional(string)
    # node_name_prefix = optional(string)
    data_ip_range = optional(object({
      end_addr    = string
      gateway     = string
      netmask     = string
      start_addr  = string
      }))
    hxdp_ip_range = optional(object({
      end_addr    = string
      gateway     = string
      netmask     = string
      start_addr  = string
      }))
    hypervisor_control_ip_range = optional(object({
      end_addr    = string
      gateway     = string
      netmask     = string
      start_addr  = string
      }))
    mgmt_ip_range = optional(object({
      end_addr    = string
      gateway     = string
      netmask     = string
      start_addr  = string
      }))
  })
}

variable "cluster_network_policy" {
  type = object({
    use_existing = bool
    name         = string
    description  = optional(string)
    jumbo_frame  = optional(bool)
    kvm_ip_range = optional(object({
      end_addr   = string
      start_addr = string
      netmask    = string
      gateway    = string
      }))
    # mac_prefix_range = optional(object({
    #   end_addr   = string
    #   start_addr = string
    #   }))
    mgmt_vlan = optional(object({
      name    = string
      vlan_id = number
      }))
    uplink_speed = optional(string)
    vm_migration_vlan = optional(object({
      name    = string
      vlan_id = number
      }))
    vm_network_vlans = optional(list(object({
      name    = string
      vlan_id = number
      })))
  })
}

variable "proxy_setting_policy" {
  type = object({
    use_existing  = bool
    name          = string
    description   = optional(string)
    hostname      = optional(string)
    password      = optional(string)
    port          = optional(number)
    username      = optional(string)
  })
  default = null
}

variable "ext_fc_storage_policy" {
  type = object({
    use_existing = bool
    name         = string
    description = optional(string)
    admin_state = optional(bool)
    exta_traffic = optional(object({
      name    = string
      vsan_id = number
      }))
    extb_traffic = optional(object({
      name    = string
      vsan_id = number
      }))
    wwxn_prefix_range = optional(object({
      end_addr   = string
      start_addr = string
      }))
  })
  default = null
}

variable "ext_iscsi_storage_policy" {
  type = object({
    use_existing = bool
    name         = string
    description = optional(string)
    admin_state = optional(bool)
    exta_traffic = optional(object({
      name    = string
      vlan_id = number
      }))
    extb_traffic = optional(object({
      name    = string
      vlan_id = number
      }))
  })
  default = null
}

variable "software_version_policy" {
  type = object({
    use_existing            = bool
    name                    = string
    description             = optional(string)
    server_firmware_version = optional(string)
    hypervisor_version      = optional(string)
    hxdp_version            = optional(string)
  })
}

variable "ucsm_config_policy" {
  type = object({
    use_existing  = bool
    name          = string
    description   = optional(string)
    kvm_ip_range = optional(object({
      end_addr    = string
      gateway     = string
      netmask     = string
      start_addr  = string
      }))
    server_firmware_version = optional(string)
  })
  default = null
}

variable "additional_vm_network_vlans" {
  type = list(object({
    name                    = string
    description             = optional(string)
    infra_network           = optional(bool)
    mtu                     = optional(number)
    network_type            = optional(string)
    trunk                   = optional(list(string))
    vlan_id                 = optional(number) # only optional if trunk set?? # set to vlan_id for consistency
    vswitch                 = optional(string)
    }))
  default = []
}
