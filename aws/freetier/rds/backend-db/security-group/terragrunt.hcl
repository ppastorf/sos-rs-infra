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

inputs = {
  name   = "${include.env.locals.env_prefix}-backend_db-security_group"
  vpc_id = dependency.vpc.outputs.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = dependency.vpc.outputs.vpc_cidr_block
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = dependency.vpc.outputs.vpc_cidr_block
    }
  ]
}

