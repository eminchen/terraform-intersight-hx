# Intersight HyperFlex Local Credential (Security) Policy Terraform Module

## Usage

```hcl
module "local_cred_policy" {

  source = "./modules/local_cred_policy"

  # omitted...
}
```

This module create a new local credential (a.k.a security) policy for reference in one or more HyperFlex cluster profiles.

A policy specifying credentials for HyperFlex cluster such as controller VM password, hypervisor username, and password.

These resources are created
* [local credential policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_local_credential_policy)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.18 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_hyperflex_local_credential_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_local_credential_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization name | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be associated with this object in Intersight. | `list(map(string))` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Policy name | `string` | `""` | no |
| <a name="input_hxdp_root_pwd"></a> [hxdp\_root\_pwd](#input\_hxdp\_root\_pwd) | HyperFlex storage controller VM password.  Must contain a minimum of 10 characters, with at least 1 lowercase, 1 uppercase, 1 numeric, and 1 of these -_@#$%^&*! special characters | `string` | `""` | no |
| <a name="input_hypervisor_admin"></a> [hypervisor\_admin](#input\_hypervisor\_admin) | Hypervisor administrator username. Must contain only alphanumeric characters. | `string` | `""` | no |
| <a name="input_hypervisor_admin_pwd"></a> [hypervisor\_admin\_pwd](#input\_hypervisor\_admin\_pwd) | Hypervisor administrator account password. | `string` | `""` | no |
| <a name="input_factory_hypervisor_password"></a> [factory\_hypervisor\_password](#input\_factory\_hypervisor\_password) | Indicates if Hypervisor password is the factory set default password. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
