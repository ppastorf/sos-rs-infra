# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/cluster/

terraform {
  source = "tfr:///terraform-aws-modules/ecs/aws//modules/cluster?version=5.11.1"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  cluster_name                          = "${include.env.locals.env_prefix}-ec2_cluster"
  default_capacity_provider_use_fargate = true
  cluster_settings = [
    {
      "name" : "containerInsights",
      "value" : "enabled"
    }
  ]
}

