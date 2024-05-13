# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/cluster/

terraform {
  source = "tfr:///terraform-aws-modules/ecs/aws//modules/cluster?version=5.11.1"
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
  cluster_name = "${local.project_name}-${local.environment}-fargate_cluster"

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

