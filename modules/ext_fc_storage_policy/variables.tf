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
  description = "Enables or disables external FC storage configuration."
  default     = true
}

variable "exta_traffic" {
  # VSAN for the primary (VSAN A) Fabric Interconnect external FC storage traffic.
  type = object({
    name    = string
    vsan_id = number
    # object_type = "replication.NamedVsan
    })
}

variable "extb_traffic" {
  # VSAN for the secondary (VSAN B) Fabric Interconnect external FC storage traffic.
  type = object({
    name    = string
    vsan_id = number
    # object_type = "replication.NamedVsan
    })
}

variable "wwxn_prefix_range" {
  # The range of WWxN addresses to use for the FC storage configuration.
  type = object({
    end_addr   = string
    start_addr = string
    # object_type = "hyperflex.WwxnPrefixRange"
    })
}
