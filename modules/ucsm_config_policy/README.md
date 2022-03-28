# Intersight HyperFlex UCSM Configuration Policy Terraform Module

## Usage

```hcl
module "ucsm_config_policy" {

  source = "./modules/ucsm_config_policy"

  # omitted...
}
```

This module create a new UCSM configuration policy for reference in one or more HyperFlex cluster profiles.

A policy specifying UCS Manager settings such as service profile org, KVM IP addresses, and MAC prefix for server configuration in Fabric Interconnect environment.

These resources are created
* [ucsm config policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ucsm_config_policy)

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
| [intersight_hyperflex_ucsm_config_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_ucsm_config_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_kvm_ip_range"></a> [kvm\_ip\_range](#input\_kvm\_ip\_range) | The Out-of-band KVM IP range.Configures the service profiles to use IP addresses within this range for setting the KVM IP of a server. | <pre>object({<br>    end_addr  = string<br>    gateway        = string<br>    netmask  = string<br>    start_addr  = string<br>  })</pre> | n/a | yes |
<!-- | <a name="input_mac_prefix_range"></a> [mac\_prefix\_range](#input\_mac\_prefix\_range) | The MAC address prefix range for configuring vNICs.Configures the service profiles to use MAC address prefixes within this range for setting the MAC address of server vNICs. | <pre>object({<br>    end_addr  = string<br>    start_addr  = string<br>  })</pre> | n/a | no | -->
| <a name="input_server_firmware_version"></a> [server\_firmware\_version](#input\_server\_firmware\_version) | The server firmware bundle version used for server components such as CIMC, adapters, BIOS, etc. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
