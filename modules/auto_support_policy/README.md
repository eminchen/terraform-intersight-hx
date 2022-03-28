# Intersight HyperFlex Auto Support Policy Terraform Module

## Usage

```hcl
module "auto_support_policy" {

  source = "./modules/auto_support_policy"

  # omitted...
}
```

This module create a new auto support policy for reference in one or more HyperFlex cluster profiles.

A policy specifying the configuration to automatically generate support tickets with Cisco TAC.

These resources are created
* [auto support policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_auto_support_policy)

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
| [intersight_hyperflex_auto_support_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_auto_support_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_admin_state"></a> [admin\_state](#input\_admin\_state) | Enable or disable Auto-Support. | `bool` | `""` | yes |
| <a name="input_service_ticket_receipient"></a> [service\_ticket\_receipient](#input\_service\_ticket\_receipient) | The recipient email address for support tickets. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
