variable "tags" {
  type    = list(map(string))
  default = []
}

# variable "organization" {
#   type        = string
#   description = "Organization name."
#   default     = "default"
# }

variable "name" {
  type        = string
  description = "Name of the virtual network. Name must be unique."
}

# variable "cluster_moid" {
#   type        = string
#   description = "MOID of the target HyperFlex cluster the virtual network will be assigned to."
# }

variable "cluster_name" {
  type        = string
  description = "The name of this HyperFlex cluster."
}

variable "description" {
  type        = string
  description = "Human readable description about this network."
  default     = ""
}

variable "infra_network" {
  type        = bool
  description = "A flag to distinguish if a network belongs to an infrastructure network or a user defined network that guest workloads can use."
  default     = false
}

variable "mtu" {
  type        = number
  description = "Maximum transmissible unit of data in bytes that can be sent across the network."
  default     = 1500
}

variable "network_type" {
  type        = string
  description = "Type of network layer, either L2 or L3.* unknown - This network is of an unknown network type.* L2 - A Layer 2 switching network type."
  default     = "L2"
}

variable "trunk" {
  type        = list(string)
  description = ""
  default     = []
}

variable "vlan_id" {
  type        = number
  description = "A VLAN id set on the network attachment point."
}

variable "vswitch" {
  type        = string
  description = "Name of the virtual switch."
  default     = "vm"
}

variable "wait_for_completion" {
  type = bool
  description = "This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. Default value is True i.e. wait."
  default = true
}
