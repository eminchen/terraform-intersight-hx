# Intersight HyperFlex Cluster Network Policy Terraform Module

## Usage

```hcl
module "cluster_network_policy" {

  source = "./modules/cluster_network_policy"

  # omitted...
}
```

This module create a new cluster network policy for reference in one or more HyperFlex cluster profiles.

A policy specifying VLANs for management, VM migration, and VM traffic.

These resources are created
* [cluster network policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_network_policy)

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
| [intersight_hyperflex_cluster_network_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_cluster_network_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_jumbo_frame"></a> [jumbo\_frame](#input\_jumbo\_frame) | Enable or disable Jumbo Frames (MTU=9000). Jumbo Frames are used by Storage Network, VM Migration Network. | `bool` | `""` | yes |
| <a name="input_mac_prefix_range"></a> [mac\_prefix\_range](#input\_mac\_prefix\_range) | The MAC address prefix range for configuring vNICs.Configures the service profiles to use MAC address prefixes within this range for setting the MAC address of server vNICs. | <pre>object({<br>    end_addr  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |
| <a name="input_mgmt_vlan"></a> [mgmt\_vlan](#input\_mgmt\_vlan) | The VLAN for the management network. | <pre>object({<br>    name  = string<br>    vlan_id  = number<br>  })</pre> | n/a | yes |
| <a name="input_uplink_speed"></a> [uplink\_speed](#input\_uplink\_speed) | Link speed of the server adapter port to the upstream switch. When the policy is attached to a cluster profile with EDGE management platform, the uplink speed can be '1G' or '10G+'. Use '10G+' for link speeds of 10G or above. When the policy is attached to a cluster profile with Fabric Interconnect management platform, the uplink speed can be 'default' only.* default - Current default value set on the hardware platform.* 1G - A link speed of 1 gigabit per second.* 10G - A link speed of 10 gigabits per second or above. | `string` | `""` | yes |
| <a name="input_vm_migration_vlan"></a> [vm\_migration\_vlan](#input\_vm\_migration\_vlan) | The VM migration VLAN.This VLAN is used for transfering VMs from one host to another during operations such a cluster upgrade.For HyperFlex Application Platform clusters, this VLAN is also used for hypervisor control traffic such asnode to node communication, pod-to-pod communication, etc. | <pre>object({<br>    name  = string<br>    vlan_id  = number<br>  })</pre> | n/a | yes |
| <a name="input_vm_network_vlans"></a> [vm\_network\_vlans](#input\_vm\_network\_vlans) | List of VM data VLANs for hosted workloads. | <pre>list(object({<br>    name  = string<br>    vlan_id  = number<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
