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

variable "hostname" {
  type        = string
  description = "HTTP Proxy server FQDN or IP."
}

variable "password" {
  type        = string
  description = "The password for the HTTP Proxy."
}

variable "port" {
  type        = number
  description = "The HTTP Proxy port number.The port number of the HTTP proxy must be between 1 and 65535, inclusive."
}

variable "username" {
  type        = string
  description = "The username for the HTTP Proxy."
}
