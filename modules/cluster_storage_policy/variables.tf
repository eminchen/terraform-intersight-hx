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

variable "disk_partition_cleanup" {
  type        = bool
  description = "If enabled, formats existing disk partitions (destroys all user data)."
}

variable "logical_avalability_zone_config" {
  type = object({
    auto_config = bool
    })
  description = "Enable or disable Logical Availability Zones (LAZ). If enabled, HyperFlex Data Platform automatically selects and groups nodes into different availability zones. For HyperFlex Data Platform versions prior to 3.0 release, this setting does not apply. For HyperFlex Data Platform versions 3.0 or higher, this setting is only applicable to Fabric Interconnect attached HyperFlex systems with 8 or more converged nodes."
}

variable "vdi_optimization" {
  type        = bool
  description = "Enable or disable VDI optimization (hybrid HyperFlex systems only)."
}
