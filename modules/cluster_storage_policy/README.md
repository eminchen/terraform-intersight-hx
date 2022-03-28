# Intersight HyperFlex Cluster Storage Policy Terraform Module

## Usage

```hcl
module "cluster_storage_policy" {

  source = "./modules/cluster_storage_policy"

  # omitted...
}
```

This module create a new clusters storage policy for reference in one or more HyperFlex cluster profiles.

A policy specifying HyperFlex cluster storage settings (optional).  

Not supported by IWE.

These resources are created
* [cluster storage policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_storage_policy)

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
| [intersight_hyperflex_cluster_storage_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_storage_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_disk_partition_cleanup"></a> [disk\_partition\_cleanup](#input\_disk\_partition\_cleanup) | If enabled, formats existing disk partitions (destroys all user data). | `bool` | `false` | yes |
| <a name="input_logical_avalability_zone_config"></a> [logical\_avalability\_zone\_config](#input\_logical\_avalability\_zone\_config) | Enable or disable Logical Availability Zones (LAZ). If enabled, HyperFlex Data Platform automatically selects and groups nodes into different availability zones. For HyperFlex Data Platform versions prior to 3.0 release, this setting does not apply. For HyperFlex Data Platform versions 3.0 or higher, this setting is only applicable to Fabric Interconnect attached HyperFlex systems with 8 or more converged nodes.  | <pre>object({<br>    auto_config  = bool<br>  })</pre> | n/a | yes |
| <a name="input_vdi_optimization"></a> [vdi\_optimization](#input\_vdi\_optimization) | Enable or disable VDI optimization (hybrid HyperFlex systems only). | `bool` | `false` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
