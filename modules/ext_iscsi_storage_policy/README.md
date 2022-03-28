# Intersight HyperFlex External iSCSI Storage Configuration Policy Terraform Module

## Usage

```hcl
module "ext_iscsi_storage_policy" {

  source = "./modules/ext_iscsi_storage_policy"

  # omitted...
}
```

This module create a new external iSCSI storage policy for reference in one or more HyperFlex cluster profiles.

A policy specifying external storage connectivity information via Fabric attached iSCSI storage.

These resources are created
* [ext iscsi storage policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ext_iscsi_storage_policy)

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
| [intersight_hyperflex_ext_iscsi_storage_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ext_iscsi_storage_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_admin_state"></a> [admin\_state](#input\_admin\_state) | Enables or disables external iSCSI storage configuration. | `bool` | `true` | yes |
| <a name="input_exta_traffic"></a> [exta\_traffic](#input\_exta\_traffic) | VLAN for the primary Fabric Interconnect external iSCSI storage traffic. | <pre>object({<br>    name  = string<br>    vlan_id        = number<br>  })</pre> | n/a | yes |
| <a name="input_extb_traffic"></a> [extb\_traffic](#input\_extb\_traffic) | VLAN for the secondary Fabric Interconnect external iSCSI storage traffic. | <pre>object({<br>    name  = string<br>    vlan_id        = number<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
