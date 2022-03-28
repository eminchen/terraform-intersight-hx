### Intersight - Common Variables

variable "intersight_key" {
  type = string
}

variable "intersight_secret" {
  type = string
}

variable "intersight_url" {
  type = string
  default = "https://intersight.com"
}

### HyperFlex Profile Variables

variable "hxdp_root_pwd" {
  type = string
  sensitive = true
}

variable "hypervisor_admin_pwd" {
  type = string
  sensitive = true
}
