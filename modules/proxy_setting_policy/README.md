# Intersight HyperFlex Proxy Setting Policy Terraform Module

## Usage

```hcl
module "proxy_setting_policy" {

  source = "./modules/proxy_setting_policy"

  # omitted...
}
```

This module create a new proxy setting policy for reference in one or more HyperFlex cluster profiles.

A policy specifying the HTTP proxy settings to be used by the HyperFlex installation process and HyperFlex storage controller VMs. This policy is required when the internet access of your servers including CIMC and HyperFlex storage controller VMs is secured by a HTTP proxy.

These resources are created
* [proxy setting policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_proxy_setting_policy)

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
| [intersight_hyperflex_proxy_setting_policy.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/hyperflex_proxy_setting_policy) | resource |
| [intersight_organization_organization.this](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Policy name. | `string` | `""` | yes |
| <a name="input_description"></a> [description](#input\_description) | Policy description. | `string` | `""` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | HTTP Proxy server FQDN or IP. | `string` | `""` | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for the HTTP Proxy. | `string` | `""` | yes |
| <a name="input_port"></a> [port](#input\_port) | The HTTP Proxy port number.The port number of the HTTP proxy must be between 1 and 65535, inclusive. | `number` | `` | yes |
| <a name="input_username"></a> [username](#input\_username) | The username for the HTTP Proxy. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
