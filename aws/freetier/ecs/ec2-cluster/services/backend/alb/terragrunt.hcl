# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/

terraform {
  source = "tfr:///terraform-aws-modules/alb/aws?version=9.9.0"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../../../vpc"
}

inputs = {
  name = "${include.env.locals.env_prefix}-backend-alb"
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

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
  target_groups = {
    ecs-http = {
      name_prefix = "h1"
      # name = ""
      protocol    = "HTTP"
      port        = 80
      target_type = "ip"
      create_attachment = false

      health_check = {
        enabled = true
        path = "/shelters"
        # healthy_threshold = ""
        # interval = ""
        # matcher = ""
        # port = ""
        # protocol = ""
        # timeout = ""
        # unhealthy_threshold = ""
      }

      # ip_address_type = ""
      # lambda_multi_value_headers_enabled = ""
      # load_balancing_algorithm_type = ""
      # load_balancing_anomaly_mitigation = ""
      # load_balancing_cross_zone_enabled = ""
      # preserve_client_ip = ""
      # protocol_version = ""
      # proxy_protocol_v2 = ""
      # slow_start = ""
      # connection_termination = ""
      # deregistration_delay = ""
      # target_health_state = {
        # enable_unhealthy_connection_termination = ""
      # }
      # target_failover = {
        # on_deregistration = ""
        # on_unhealthy = ""
      # }
    }
  }
}

