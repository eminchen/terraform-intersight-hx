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

variable "kvm_ip_range" {
  type = object({
    end_addr    = string
    gateway     = string
    netmask     = string
    start_addr  = string
    })
  description = "The Out-of-band KVM IP range.Configures the service profiles to use IP addresses within this range for setting the KVM IP of a server."
}

variable "server_firmware_version" {
  type        = string
  description = "The server firmware bundle version used for server components such as CIMC, adapters, BIOS, etc."
}
