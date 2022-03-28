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

variable "hxdp_root_pwd" {
  type        = string
  description = "HyperFlex storage controller VM password.  Must contain a minimum of 10 characters, with at least 1 lowercase, 1 uppercase, 1 numeric, and 1 of these -_@#$%^&*! special characters"
  ### Validation?
}

variable "hypervisor_admin" {
  type        = string
  description = "Hypervisor administrator username. Must contain only alphanumeric characters."
}

variable "hypervisor_admin_pwd" {
  type        = string
  description = "Hypervisor administrator account password."
}

variable "factory_hypervisor_password" {
  type        = bool
  description = "Indicates if Hypervisor password is the factory set default password."
  default     = true
}
