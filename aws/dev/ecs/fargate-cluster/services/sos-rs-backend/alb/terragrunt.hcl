# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/

terraform {
  source = "tfr:///terraform-aws-modules/alb/aws?version=9.9.0"
}

include "env" {
  path = find_in_parent_folders("environment.hcl")
  expose = true
}

dependency "vpc" {
  config_path = "../../../../../vpc"
}

locals {
  alb_name = "${include.env.locals.env_prefix}-sos-rs-backend-alb"
}

inputs = {
  name = local.alb_name
  load_balancer_type = "application"

  internal = false
  vpc_id  = dependency.vpc.outputs.vpc_id
  subnets = dependency.vpc.outputs.public_subnets

  enable_deletion_protection = false

  # route53_records = {}
  # access_logs = {}

  # security group
  security_group_ingress_rules = {
    http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

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

