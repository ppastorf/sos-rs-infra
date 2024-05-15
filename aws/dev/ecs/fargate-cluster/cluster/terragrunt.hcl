# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/cluster/

terraform {
  source = "tfr:///terraform-aws-modules/ecs/aws//modules/cluster?version=5.11.1"
}

include "env" {
  path = find_in_parent_folders("environment.hcl")
  expose = true
}

inputs = {
  cluster_name = "${include.env.locals.env_prefix}-fargate_cluster"

  cluster_settings = [
    {
      "name": "containerInsights",
      "value": "enabled"
    }
  ]

  default_capacity_provider_use_fargate = true

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
        base = 0
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 0
      }
    }
  }
}

