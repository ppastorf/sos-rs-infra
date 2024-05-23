# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/zones?version=2.11.1"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../vpc"
}

locals {
  zone_name = basename(dirname(get_terragrunt_dir()))
}

inputs = {
  zones = {
    (local.zone_name) = {
      force_destroy = true
      vpc = {
        vpc_id = dependency.vpc.outputs.vpc_id
      }
    }
  }
}

