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
  description = "Enable or disable Auto-Support."
}

variable "service_ticket_receipient" {
  type        = string
  description = "The recipient email address for support tickets."
}
