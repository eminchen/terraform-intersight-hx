# Intersight HyperFlex IWE Cluster Additional (Day 2) VLAN Terraform Module

## Usage

```hcl
module "additional_vlans" {

  source = "./modules/additional_vlans"

  # omitted...
}
```

This module creates an additional virutal network (VLAN) on a target IWE HyperFlex cluster.  

Depicts network configuration used to create a virtual network.

These resources are created
* [additional vlan](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/virtualization_virtual_network)

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
| [intersight_virtualization_virtual_network.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/virtualization_virtual_network) | resource |
| [intersight_virtualization_iwe_cluster.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/virtualization_iwe_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the virtual network. Name must be unique. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Human readable description about this network. | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the target HyperFlex cluster the virtual network will be assigned to. | `string` | `""` | yes |
| <a name="input_infra_network"></a> [infra\_network](#input\_infra\_network) | A flag to distinguish if a network belongs to an infrastructure network or a user defined network that guest workloads can use. | `bool` | `false` | no |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | Type of network layer, either L2 or L3.* unknown - This network is of an unknown network type.* L2 - A Layer 2 switching network type. | `string` | `"L2"` | no |
| <a name="input_trunk"></a> [trunk](#input\_trunk) |  | `list(string)` | `[]` | no |
| <a name="input_vlan_id"></a> [vlan](#input\_vlan\_id) | A VLAN id set on the network attachment point. | `number` | `` | yes |
| <a name="input_vswitch"></a> [vswitch](#input\_vswitch) | Name of the virtual switch. | `string` | `"vm"` | no |
| <a name="input_wait_for_completion"></a> [wait\_for\_completion](#input\_wait\_for\_completion) | This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state. Default value is True i.e. wait. | `bool` | `true` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
