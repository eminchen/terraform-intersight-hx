# Intersight HyperFlex Node Configuration Policy Terraform Module

## Usage

```hcl
module "node_config_policy" {

  source = "./modules/node_config_policy"

  # omitted...
}
```

This module create a new node configuration policy for reference in one or more HyperFlex cluster profiles.

A policy specifying node details such as management and storage data IP ranges. For HyperFlex Edge, storage data IP range is pre-defined.

These resources are created
* [node config policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_node_config_policy)

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
| [intersight_hyperflex_node_config_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_node_config_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_node_name_prefix"></a> [node\_name\_prefix](#input\_node\_name\_prefix) | The node name prefix that is used to automatically generate the default hostname for each server.A dash (-) will be appended to the prefix followed by the node number to form a hostname.This default naming scheme can be manually overridden in the node configuration.The maximum length of a prefix is 60, must only contain alphanumeric characters or dash (-), and muststart with an alphanumeric character. | `string` | `""` | yes |
| <a name="input_data_ip_range"></a> [data\_ip\_range](#input\_data\_ip\_range) | The range of storage data IPs to be assigned to the nodes. | <pre>object({<br>    end_addr  = string<br>    gateway        = string<br>    netmask  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |
| <a name="input_hxdp_ip_range"></a> [hxdp\_ip\_range](#input\_hxdp\_ip\_range) | The range of storage management IPs to be assigned to the nodes. | <pre>object({<br>    end_addr  = string<br>    gateway        = string<br>    netmask  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |
| <a name="input_hypervisor_control_ip_range"></a> [hypervisor\_control\_ip\_range](#input\_hypervisor\_control\_ip\_range) | *IWE ONLY* The range of IPs to be assigned to each hypervisor node for VM migration and hypervior control. | <pre>object({<br>    end_addr  = string<br>    gateway        = string<br>    netmask  = string<br>    start_addr  = string<br>  })</pre> | n/a | no |
| <a name="input_mgmt_ip_range"></a> [mgmt\_ip\_range](#input\mgmt\_ip\_range) | The range of management IPs to be assigned to the nodes.  | <pre>object({<br>    end_addr  = string<br>    gateway        = string<br>    netmask  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
