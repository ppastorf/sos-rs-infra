# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/

terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=5.1.2"
}

include "project" {
  path = find_in_parent_folders("project.hcl")
  expose = true
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

dependency "vpc" {
  config_path = "../../../vpc"
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment
}

inputs = {
  name = "${include.project.locals.project_name}-${include.env.locals.environment}-backend_db_security_group"
  description = "Security group para o banco de dados do backend"
  vpc_id = dependency.vpc.outputs.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

