# Intersight HyperFlex Node Profile Terraform Module

## Usage

```hcl
module "node_profile" {

  source = "./modules/node_profile"

  # omitted...
}
```

This module create a new HX node (server) profile.

A configuration profile per node in the HyperFlex cluster. It defines node settings such as IP address configuration for hypervisor management network, storage data network, HyperFlex management network, and the assigned physical server.

These resources are created
* [node profile](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_node_profile)

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
| [intersight_hyperflex_node_profile.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_node_profile) | resource |
| [intersight_compute_physical_summary.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/compute_physical_summary) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Profile name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Profile description. | `string` | `""` | no |
| <a name="input_serial_number"></a> [serial\_number](#input\_serial\_number) | Serial number of the node (server). | `string` | `""` | yes |
| <a name="input_cluster_moid"></a> [cluster\_moid](#input\_cluster\_moid) | MOID of the target HyperFlex cluster the node will be assigned to. | `string` | `""` | yes |
| <a name="input_hxdp_data_ip"></a> [hxdp\_data\_ip](#input\_hxdp\_data\_ip) | IP address for storage data network (Controller VM interface). | `string` | `""` | yes |
| <a name="input_hxdp_mgmt_ip"></a> [hxdp\_mgmt\_ip](#input\_hxdp\_mgmt\_ip) | IP address for Hypervisor management network (Controller VM interface). | `string` | `""` | yes |
| <a name="input_hxdp_storage_client_ip"></a> [hxdp\_storage\_client\_ip](#input\_hxdp\_storage\_client\_ip) | IP address for storage client network (Controller VM interface). | `string` | `""` | no |
| <a name="input_hypervisor_control_ip"></a> [hypervisor\_control\_ip](#input\_hypervisor\_control\_ip) | IP address for hypervisor control such as VM migration or pod management (Hypervisor interface). | `string` | `""` | no |
| <a name="input_hypervisor_data_ip"></a> [hypervisor\_data\_ip](#input\_hypervisor\_data\_ip) | IP address for storage data network (Hypervisor interface). | `string` | `""` | yes |
| <a name="input_hypervisor_mgmt_ip"></a> [hypervisor\_mgmt\_ip](#input\_hypervisor\_mgmt\_ip) | IP address for Hypervisor management network (Hypervisor interface). | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | MOID of HyperFlex node (server) profile |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
