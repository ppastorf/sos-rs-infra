# https://registry.terraform.io/modules/terraform-do-modules/vpc/digitalocean/latest

terraform {
  source = "tfr:///terraform-do-modules/vpc/digitalocean?version=1.0.0"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  name       = "${include.env.locals.env_prefix}-vpc"
  enable_vpc = true
  ip_range   = "10.1.0.0/16"

  region      = include.env.locals.region
  application = include.env.locals.project_name
  environment = include.env.locals.environment
}
