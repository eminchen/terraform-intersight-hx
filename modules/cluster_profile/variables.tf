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
  description = "This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. Default value is True i.e. wait."
  default = true
}

variable "tags" {
  type    = list(map(string))
  default = []
}

variable "organization" {
  type        = string
  description = "Organization name."
  default     = "default"
}

variable "name" {
  type        = string
  description = "HyperFlex cluster profile name."
}

variable "description" {
  type        = string
  description = "HyperFlex cluster profile description."
}

variable "data_ip_address" {
  type        = string
  description = "The storage data IP address for the HyperFlex cluster."
  default = null
}

variable "hypervisor_control_ip_address" {
  type        = string
  description = "The hypervisor control virtual IP address for the HyperFlex compute cluster that is used for node/pod management."
}

variable "hypervisor_type" {
  type        = string
  description = "The hypervisor type for the HyperFlex cluster.* ESXi - The hypervisor running on the HyperFlex cluster is a Vmware ESXi hypervisor of any version.* HyperFlexAp - The hypervisor of the virtualization platform is Cisco HyperFlex Application Platform.* IWE - The hypervisor of the virtualization platform is Cisco Intersight Workload Engine.* Hyper-V - The hypervisor running on the HyperFlex cluster is Microsoft Hyper-V.* Unknown - The hypervisor running on the HyperFlex cluster is not known."

  validation {
    condition = contains(["ESXi", "HyperFlexAp", "IWE", "Hyper-V", "Unknown"], var.hypervisor_type)
    error_message = "The hypervisor_type value must be one of ESXi, HyperFlexAp, IWE, Hyper-V or Unknown."
  }
}

variable "mac_address_prefix" {
  type        = string
  description = "The MAC address prefix in the form of 00:25:B5:XX."
}

variable "mgmt_ip_address" {
  type        = string
  description = "The management IP address for the HyperFlex cluster."
}

variable "mgmt_platform" {
  type        = string
  description = "The management platform for the HyperFlex cluster.* FI - The host servers used in the cluster deployment are managed by a UCS Fabric Interconnect.* EDGE - The host servers used in the cluster deployment are standalone servers."

  validation {
    condition = contains(["FI","EDGE"], var.mgmt_platform)
    error_message = "The mgmt_platform value must be one of FI or EDGE."
  }
}

variable "replication" {
  type        = number
  description = "The number of copies of each data block written."
}

variable "host_name_prefix" {
  type        = string
  description = "The node name prefix that is used to automatically generate the default hostname for each server.A dash (-) will be appended to the prefix followed by the node number to form a hostname.This default naming scheme can be manually overridden in the node configuration.The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and must start with an alphanumeric character."
}

variable "storage_data_vlan" {
  type        = object({
    name    = string
    vlan_id = number
    })
  description = "The VLAN for the HyperFlex storage data traffic."
}

variable "storage_cluster_auxiliary_ip" {
  type        = string
  description = "The auxiliary storage IP address for the HyperFlex cluster. For two node clusters, this is the IP address of the auxiliary ZK controller."
}

variable "storage_type" {
  type        = string
  description = "The storage type used for the HyperFlex cluster (HyperFlex Storage or 3rd party).* HyperFlexDp - The type of storage is HyperFlex Data Platform.* ThirdParty - The type of storage is 3rd Party Storage (PureStorage, etc..)."
  default     = "HyperFlexDp"

  validation {
    condition = contains(["HyperFlexDp","ThirdParty"], var.storage_type)
    error_message = "The storage_type value must be one of HyperFlexDp or ThirdParty."
  }
}

variable "wwxn_prefix" {
  type        = string
  description = "The WWxN prefix in the form of 20:00:00:25:B5:XX."
}

variable "storage_client_vlan" {
  type        = object({
    name       = string
    vlan_id    = number
    ip_address = string
    netmask    = string
    })
  description = "The VLAN for the HyperFlex storage client traffic."
}

variable "cluster_internal_subnet" {
  type        = object({
    gateway    = string
    ip_address = string
    netmask    = string
    })
  description = "A CIDR subnet for the cluster internal network. This applies to Intersight Workload Engine clusters only."
}

variable "local_cred_policy_moid" {
  type = string
}

variable "sys_config_policy_moid" {
  type = string
}

variable "node_config_policy_moid" {
  type = string
}

variable "cluster_network_policy_moid" {
  type = string
}

variable "software_version_policy_moid" {
  type = string
}

variable "auto_support_policy_moid" {
  type = string
}

variable "proxy_setting_policy_moid" {
  type = string
}

variable "vcenter_config_policy_moid" {
  type = string
}

variable "cluster_storage_policy_moid" {
  type = string
}

variable "ext_fc_storage_policy_moid" {
  type = string
}

variable "ext_iscsi_storage_policy_moid" {
  type = string
}

variable "ucsm_config_policy_moid" {
  type = string
}
