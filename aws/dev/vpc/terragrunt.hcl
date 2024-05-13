# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

include "project" {
  path = find_in_parent_folders("project.hcl")
  expose = true
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment
}

inputs = {
  name = "${local.project_name}-${local.environment}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
}

