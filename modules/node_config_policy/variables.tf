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

# variable "node_name_prefix" {
#   type        = string
#   description = "The node name prefix that is used to automatically generate the default hostname for each server.A dash (-) will be appended to the prefix followed by the node number to form a hostname.This default naming scheme can be manually overridden in the node configuration.The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and muststart with an alphanumeric character."
#
#   ## Validation rule?
# }

variable "data_ip_range" {
  type = object({
    end_addr    = string
    gateway     = string
    netmask     = string
    start_addr  = string
    })
}

variable "hxdp_ip_range" {
  type = object({
    end_addr    = string
    gateway     = string
    netmask     = string
    start_addr  = string
    })
}

variable "hypervisor_control_ip_range" {
  type = object({
    end_addr    = string
    gateway     = string
    netmask     = string
    start_addr  = string
    })
}

variable "mgmt_ip_range" {
  type = object({
    end_addr    = string
    gateway     = string
    netmask     = string
    start_addr  = string
    })
}
