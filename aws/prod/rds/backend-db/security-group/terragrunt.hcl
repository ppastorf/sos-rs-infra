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

inputs = {
}

