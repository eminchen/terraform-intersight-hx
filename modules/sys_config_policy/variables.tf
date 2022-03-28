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

variable "dns_domain_name" {
  type        = string
  description = "The DNS Search Domain Name."
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers."
}

variable "ntp_servers" {
  type        = list(string)
  description = "List of NTP servers."
}

variable "timezone" {
  type        = string
  description = "The timezone of the HyperFlex cluster's system clock (i.e. Australia/Sydney)."
}
