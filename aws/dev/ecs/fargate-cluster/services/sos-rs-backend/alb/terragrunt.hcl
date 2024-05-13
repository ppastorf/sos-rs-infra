# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/cluster/

terraform {
  source = "tfr:///terraform-aws-modules/alb/aws?version=9.9.0"
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
  config_path = "../../../../../vpc"
}

dependency "security_group" {
  config_path = "../security-group"
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment
  alb_name = "${local.project_name}-${local.environment}-sos-rs-backend-alb"
}

inputs = {
  name = local.alb_name

  vpc_id  = dependency.vpc.outputs.vpc_id

  # verify
  subnets = dependency.vpc.outputs.public_subnets

  # security_group_ingress_rules = {
  #   all_http = {
  #     from_port   = 80
  #     to_port     = 80
  #     ip_protocol = "tcp"
  #     cidr_ipv4   = "0.0.0.0/0"
  #   }
  # }
  # security_group_egress_rules = {
  #   all = {
  #     ip_protocol = "-1"
  #     cidr_ipv4   = "0.0.0.0/0"
  #   }
  # }

  create_security_group = false
  security_groups = [dependency.security_group.outputs.security_group_id]

  # access_logs = {
  #   bucket = "${local.alb_name}-logs"
  # }

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "ecs-http"
      }
    }
  }

  target_groups = {
    ecs-http = {
      name_prefix = "h1"
      protocol    = "HTTP"
      port        = 80
      target_type = "ip"
      create_attachment = false
    }
  }
}

