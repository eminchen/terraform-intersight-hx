### HyperFlex Node Profile Variables

variable "name" {
  type        = string
  description = "HyperFlex node (server) profile name."
}

variable "description" {
  type        = string
  description = "HyperFlex node (server) profile description."
}

variable "serial_number" {
  type        = string
  description = "Serial number of the node (server)."
}

variable "cluster_moid" {
  type        = string
  description = "MOID of the target HyperFlex cluster the node will be assigned to."
}

variable "hypervisor_type" {
  type        = string
  description = "The hypervisor type for the HyperFlex cluster.* ESXi - The hypervisor running on the HyperFlex cluster is a Vmware ESXi hypervisor of any version.* HyperFlexAp - The hypervisor of the virtualization platform is Cisco HyperFlex Application Platform.* IWE - The hypervisor of the virtualization platform is Cisco Intersight Workload Engine.* Hyper-V - The hypervisor running on the HyperFlex cluster is Microsoft Hyper-V.* Unknown - The hypervisor running on the HyperFlex cluster is not known."

  validation {
    condition = contains(["ESXi", "HyperFlexAp", "IWE", "Hyper-V", "Unknown"], var.hypervisor_type)
    error_message = "The hypervisor_type value must be one of ESXi, HyperFlexAp, IWE, Hyper-V or Unknown."
  }
}

variable "hxdp_data_ip" {
  type        = string
  description = "IP address for storage data network (Controller VM interface)."
  default     = null
}

variable "hxdp_mgmt_ip" {
  type        = string
  description = "IP address for Hypervisor management network (Controller VM interface)."
  default     = null
}

variable "hxdp_storage_client_ip" {
  type        = string
  description = "IP address for storage client network (Controller VM interface)."
  default     = null
}

variable "hypervisor_control_ip" {
  type        = string
  description = "IP address for hypervisor control such as VM migration or pod management (Hypervisor interface)."
  default     = null
}

variable "hypervisor_data_ip" {
  type        = string
  description = "IP address for storage data network (Hypervisor interface)."
  default     = null
}

variable "hypervisor_mgmt_ip" {
  type        = string
  description = "IP address for Hypervisor management network (Hypervisor interface)."
  default     = null
}
