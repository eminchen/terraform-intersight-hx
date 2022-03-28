terraform {
  required_version = ">=1.1.0"

  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.23"
    }
  }
  # experiments = [module_variable_optional_attrs]
}
