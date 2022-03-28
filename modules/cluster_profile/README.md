# Intersight HyperFlex Cluster Profile Terraform Module

## Usage

```hcl
module "cluster_profile" {

  source = "./modules/cluster_profile"

  # omitted...
}
```

This module create a new cluster profile with referenced policies.

A profile specifying configuration settings for a HyperFlex cluster.

These resources are created
* [cluster profile](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_profile)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_hyperflex_cluster_profile.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_profile) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Profile name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Profile description. | `string` | `""` | no |
| <a name="input_action"></a> [action](#input\_action) | User initiated action. Each profile type has its own supported actions. For HyperFlex cluster profile, the supported actions are -- Validate, Deploy, Continue, Retry, Abort, Unassign. | `string` | `"Validate"` | yes |
| <a name="input_wait_for_completion"></a> [wait\_for\_completion](#input\_wait\_for\_completion) | This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. Default value is True i.e. wait. | `bool` | `true` | yes |
| <a name="input_data_ip_address"></a> [data\_ip\_address](#input\_data\_ip\_address) | The storage data IP address for the HyperFlex cluster. | `string` | `"169.254.0.1"` | no |
| <a name="input_host_name_prefix"></a> [host\_name\_prefix](#input\_host\_name\_prefix) | The node name prefix that is used to automatically generate the default hostname for each server.A dash (-) will be appended to the prefix followed by the node number to form a hostname.This default naming scheme can be manually overridden in the node configuration.The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and must start with an alphanumeric character. | `string` | `""` | yes |
| <a name="input_hypervisor_control_ip_address"></a> [hypervisor\_control\_ip\_address](#input\_hypervisor\_control\_ip\_address) | The hypervisor control virtual IP address for the HyperFlex compute cluster that is used for node/pod management. | `string` | `""` | yes |
| <a name="input_hypervisor_type"></a> [hypervisor\_type](#input\_hypervisor\_type) | The hypervisor type for the HyperFlex cluster.* ESXi - The hypervisor running on the HyperFlex cluster is a Vmware ESXi hypervisor of any version.* HyperFlexAp - The hypervisor of the virtualization platform is Cisco HyperFlex Application Platform.* IWE - The hypervisor of the virtualization platform is Cisco Intersight Workload Engine.* Hyper-V - The hypervisor running on the HyperFlex cluster is Microsoft Hyper-V.* Unknown - The hypervisor running on the HyperFlex cluster is not known. | `string` | `""` | yes |
| <a name="input_mac_address_prefix"></a> [mac\_address\_prefix](#input\_mac\_address\_prefix) | The MAC address prefix in the form of 00:25:B5:XX. | `string` | `""` | yes |
| <a name="input_mgmt_ip_address"></a> [mgmt\_ip\_address](#input\_mgmt\_ip\_address) | The management IP address for the HyperFlex cluster. | `string` | `""` | yes |
| <a name="input_mgmt_platform"></a> [mgmt\_platform](#input\_mgmt\_platform) | The management platform for the HyperFlex cluster.* FI - The host servers used in the cluster deployment are managed by a UCS Fabric Interconnect.* EDGE - The host servers used in the cluster deployment are standalone servers. | `string` | `""` | yes |
| <a name="input_replication"></a> [replication](#input\_replication) | The number of copies of each data block written. | `number` | `` | yes |
| <a name="input_storage_cluster_auxiliary_ip"></a> [storage\_cluster\_auxiliary\_ip](#input\_storage\_cluster\_auxiliary\_ip) | The auxiliary storage IP address for the HyperFlex cluster. For two node clusters, this is the IP address of the auxiliary ZK controller. | `string` | `""` | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The storage type used for the HyperFlex cluster (HyperFlex Storage or 3rd party).* HyperFlexDp - The type of storage is HyperFlex Data Platform.* ThirdParty - The type of storage is 3rd Party Storage (PureStorage, etc..). | `string` | `"HyperFlexDp"` | no |
| <a name="input_wwxn_prefix"></a> [wwxn\_prefix](#input\_wwxn\_prefix) | The WWxN prefix in the form of 20:00:00:25:B5:XX. | `string` | `""` | yes |
| <a name="input_auto_support_policy_moid"></a> [auto\_support\_policy\_moid](#input\_auto\_support\_policy\_moid) | (Optional) The MOID for the referenced auto support policy | `string` | `""` | no |
| <a name="input_cluster_internal_subnet"></a> [cluster\_internal\_subnet](#input\_cluster\_internal\_subnet) | A CIDR subnet for the cluster internal network. This applies to Intersight Workload Engine clusters only. | <pre>object({<br>    gateway  = string<br>    ip_address  = string<br>    netmask  = string<br>  })</pre> | n/a | no |
| <a name="input_cluster_network_policy_moid"></a> [cluster\_network\_policy\_moid](#input\_cluster\_network\_policy\_moid) | The MOID for the referenced cluster network policy | `string` | `""` | yes |
| <a name="input_cluster_storage_policy_moid"></a> [cluster\_storage\_policy\_moid](#input\_cluster\_storage\_policy\_moid) | (Optional) The MOID for the referenced cluster storage policy | `string` | `""` | no |
| <a name="input_ext_fc_storage_policy_moid"></a> [ext\_fc\_storage\_policy\_moid](#input\_ext\_fc\_storage\_policy\_moid) | (Optional) The MOID for the referenced external FC storage policy | `string` | `""` | no |
| <a name="input_ext_iscsi_storage_policy_moid"></a> [ext\_iscsi\_storage\_policy\_moid](#input\_ext\_iscsi\_storage\_policy\_moid) | (Optional) The MOID for the referenced external iSCSI storage policy | `string` | `""` | no |
| <a name="input_local_cred_policy_moid"></a> [local\_cred\_policy\_moid](#input\_local\_cred\_policy\_moid) | The MOID for the referenced local credential policy | `string` | `""` | yes |
| <a name="input_node_config_policy_moid"></a> [node\_config\_policy\_moid](#input\_node\_config\_policy\_moid) | The MOID for the referenced node configuration policy | `string` | `""` | yes |
| <a name="input_proxy_setting_policy_moid"></a> [proxy\_setting\_policy\_moid](#input\_proxy\_setting\_policy\_moid) | (Optional) The MOID for the referenced proxy setting policy | `string` | `""` | no |
| <a name="input_software_version_policy_moid"></a> [software\_version\_policy\_moid](#input\_software\_version\_policy\_moid) | The MOID for the referenced software version policy | `string` | `""` | yes |
| <a name="input_storage_client_vlan"></a> [storage\_client\_vlan](#input\_storage\_client\_vlan) | (Optional) The VLAN for the HyperFlex storage client traffic (IWE Only) | <pre>object({<br>    name  = string<br>    vlan_id  = number<br>    ip_address  = string<br>    netmask  = string<br>  })</pre> | n/a | no |
| <a name="input_storage_data_vlan"></a> [storage\_data\_vlan](#input\_storage\_data\_vlan) | The VLAN for the HyperFlex storage data traffic. | <pre>object({<br>    name  = string<br>    vlan_id  = number<br>  })</pre> | n/a | yes |
| <a name="input_sys_config_policy_moid"></a> [sys\_config\_policy\_moid](#input\_sys\_config\_policy\_moid) | The MOID for the referenced system configuration policy | `string` | `""` | yes |
| <a name="input_vcenter_config_policy_moid"></a> [vcenter\_config\_policy\_moid](#input\_vcenter\_config\_policy\_moid) | (Optional) The MOID for the referenced vCenter configuration policy (ESXi Only)| `string` | `""` | no |
| <a name="input_ucsm_config_policy_moid"></a> [ucsm\_config\_policy\_moid](#input\_ucsm\_config\_policy\_moid) | (Optional) The MOID for the referenced UCSM configuration policy (UCSM FI-attached Only)| `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | MOID of HyperFlex cluster profile |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
