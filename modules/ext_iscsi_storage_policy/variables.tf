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

variable "admin_state" {
  type        = bool
  description = "Enables or disables external iSCSI storage configuration."
  default     = true
}

variable "exta_traffic" {
  # VLAN for the primary Fabric Interconnect external iSCSI storage traffic.
  type = object({
    name    = string
    vlan_id = number
    # object_type = "replication.NamedVsan
    })
}

variable "extb_traffic" {
  # VLAN for the secondary Fabric Interconnect external iSCSI storage traffic.
  type = object({
    name    = string
    vlan_id = number
    # object_type = "replication.NamedVsan
    })
}
