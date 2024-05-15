# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

include "env" {
  path = find_in_parent_folders("environment.hcl")
  expose = true
}

inputs = {
  name = "${include.env.locals.env_prefix}-vpc"
  cidr = "10.1.0.0/16"

  azs = [
    "sa-east-1a",
    "sa-east-1b",
    "sa-east-1c"
  ]
  
  private_subnets = [
    "10.1.1.0/24",
    "10.1.2.0/24",
    "10.1.3.0/24"
  ]
  
  public_subnets = [
    "10.1.101.0/24",
    "10.1.102.0/24",
    "10.1.103.0/24"
  ]

  enable_nat_gateway = true
  enable_vpn_gateway = false
}

