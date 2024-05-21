# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/

terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=5.1.2"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../vpc"
}

locals {
  parent = basename(dirname(get_terragrunt_dir()))
  name   = "${include.env.locals.env_prefix}-${local.parent}-security-group"
}

inputs = {
  name   = local.name
  description = local.name
  vpc_id = dependency.vpc.outputs.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "179.94.142.123/32"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

