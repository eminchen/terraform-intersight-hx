# Intersight HyperFlex vCenter Configuration Policy Terraform Module

## Usage

```hcl
module "vcenter_config_policy" {

  source = "./modules/vcenter_config_policy"

  # omitted...
}
```

This module create a new vCenter configuration policy for reference in one or more HyperFlex cluster profiles.

A policy specifying vCenter configuration.

These resources are created
* [vcenter config policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_vcenter_config_policy)

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
| [intersight_hyperflex_vcenter_config_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_vcenter_config_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_data_center"></a> [data\_center](#input\_data\_center) | The vCenter datacenter name. | `string` | `""` | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The vCenter server FQDN or IP. | `string` | `""` | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for authenticating with vCenter. Follow the corresponding password policy governed by vCenter. | `string` | `""` | yes |
| <a name="input_sso_url"></a> [sso_url](#input\_sso\_url) | Overrides the default vCenter Single Sign-On URL. Do not specify unless instructed by Cisco TAC. | `string` | `""` | no |
| <a name="input_username"></a> [username](#input\_username) | The vCenter username (e.g. administrator@vsphere.local). | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
