# Intersight HyperFlex Software Version Policy Terraform Module

## Usage

```hcl
module "software_version_policy" {

  source = "./modules/software_version_policy"

  # omitted...
}
```

This module create a new software version policy for reference in one or more HyperFlex cluster profiles.

A policy capturing software versions for different HyperFlex Cluster compatible components ( like HyperFlex Data Platform, Hypervisor, etc. ), that the user wishes to apply on the HyperFlex cluster.

These resources are created
* [software version policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/hyperflex_software_version_policy)

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
| [intersight_hyperflex_software_version_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_local_credential_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_server_firmware_version"></a> [server\_firmware\_version](#input\_server\_firmware\_version) | Desired server firmware version to apply on the HyperFlex Cluster. | `string` | `""` | yes |
| <a name="input_hypervisor_version"></a> [hypervisor\_version](#input\_hypervisor\_version) | Desired hypervisor version to apply for all the nodes on the HyperFlex cluster. | `string` | `""` | yes |
| <a name="input_hxdp_version"></a> [hxdp\_version](#input\_hxdp\_version) | Desired HyperFlex Data Platform software version to apply on the HyperFlex cluster. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
