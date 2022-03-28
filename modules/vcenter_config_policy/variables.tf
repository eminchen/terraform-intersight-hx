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

variable "data_center" {
  type        = string
  description = "The vCenter datacenter name."
}

variable "hostname" {
  type        = string
  description = "The vCenter server FQDN or IP."
}

variable "password" {
  type        = string
  description = "The password for authenticating with vCenter. Follow the corresponding password policy governed by vCenter."
}

variable "sso_url" {
  type        = string
  description = "Overrides the default vCenter Single Sign-On URL. Do not specify unless instructed by Cisco TAC."
}

variable "username" {
  type        = string
  description = "The vCenter username (e.g. administrator@vsphere.local)."
}
