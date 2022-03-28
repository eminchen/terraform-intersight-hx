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
  description = "Policy name."
}

variable "description" {
  type        = string
  description = "Policy description."
  default     = ""
}

variable "jumbo_frame" {
  type        = bool
  description = "Enable or disable Jumbo Frames (MTU=9000). Jumbo Frames are used by Storage Network, VM Migration Network."
}

variable "kvm_ip_range" {
  type        = object({
    end_addr   = string
    start_addr = string
    netmask    = string
    gateway    = string
    })
  description = "The Out-of-band KVM IP range.Configures the service profiles to use IP addresses within this range for setting the KVM IP of a server."
}

# variable "mac_prefix_range" {
#   type        = object({
#     end_addr   = string
#     start_addr = string
#     })
#   description = "The MAC address prefix range for configuring vNICs.Configures the service profiles to use MAC address prefixes within this range for setting the MAC address of server vNICs."
# }

variable "mgmt_vlan" {
  type        = object({
    name    = string
    vlan_id = number
    })
  description = "The VLAN for the management network."
}

variable "uplink_speed" {
  type        = string
  description = "Link speed of the server adapter port to the upstream switch. When the policy is attached to a cluster profile with EDGE management platform, the uplink speed can be '1G' or '10G+'. Use '10G+' for link speeds of 10G or above. When the policy is attached to a cluster profile with Fabric Interconnect management platform, the uplink speed can be 'default' only.* default - Current default value set on the hardware platform.* 1G - A link speed of 1 gigabit per second.* 10G - A link speed of 10 gigabits per second or above."
}

variable "vm_migration_vlan" {
  type        = object({
    name    = string
    vlan_id = number
    })
  description = "The VM migration VLAN.This VLAN is used for transfering VMs from one host to another during operations such a cluster upgrade.For HyperFlex Application Platform clusters, this VLAN is also used for hypervisor control traffic such asnode to node communication, pod-to-pod communication, etc."
}

variable "vm_network_vlans" {
  type        = list(object({
    name                  = string
    vlan_id               = number
    additional_properties = optional(string)
    class_id              = optional(string)
    object_type           = optional(string)
    }))
  description = "List of VM data VLANs for hosted workloads."
  default = []
}
