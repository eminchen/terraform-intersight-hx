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

variable "server_firmware_version" {
  type        = string
  description = "Desired server firmware version to apply on the HyperFlex Cluster."
}

variable "hypervisor_version" {
  type        = string
  description = "Desired hypervisor version to apply for all the nodes on the HyperFlex cluster."
  default = null
}

variable "hxdp_version" {
  type        = string
  description = "Desired HyperFlex Data Platform software version to apply on the HyperFlex cluster."
}
