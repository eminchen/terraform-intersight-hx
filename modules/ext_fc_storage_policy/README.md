# Intersight HyperFlex External FC Storage Configuration Policy Terraform Module

## Usage

```hcl
module "ext_fc_storage_policy" {

  source = "./modules/ext_fc_storage_policy"

  # omitted...
}
```

This module create a new external FC storage policy for reference in one or more HyperFlex cluster profiles.

A policy specifying external storage connectivity information via Fabric attached FC storage.

These resources are created
* [ext fc storage policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ext_fc_storage_policy)

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
| [intersight_hyperflex_ext_fc_storage_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ext_fc_storage_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_admin_state"></a> [admin\_state](#input\_admin\_state) | Enables or disables external FC storage configuration. | `bool` | `true` | yes |
| <a name="input_exta_traffic"></a> [exta\_traffic](#input\_exta\_traffic) | VSAN for the primary (VSAN A) Fabric Interconnect external FC storage traffic. | <pre>object({<br>    name  = string<br>    vsan_id        = number<br>  })</pre> | n/a | yes |
| <a name="input_extb_traffic"></a> [extb\_traffic](#input\_extb\_traffic) | VSAN for the secondary (VSAN B) Fabric Interconnect external FC storage traffic. | <pre>object({<br>    name  = string<br>    vsan_id        = number<br>  })</pre> | n/a | yes |
| <a name="input_wwxn_prefix_range"></a> [wwxn\_prefix\_range](#input\_wwxn\_prefix\_range) | The range of WWxN addresses to use for the FC storage configuration. | <pre>object({<br>    end_addr  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
