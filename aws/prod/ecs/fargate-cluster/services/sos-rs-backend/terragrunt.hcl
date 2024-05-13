# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/service/

terraform {
  source = "tfr:///terraform-aws-modules/ecs/aws//modules/service?version=5.11.1"
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
  config_path = "../../../../vpc"
}

dependency "ecs_cluster" {
  config_path = "../../cluster"
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment

  # consideracao importante ao montar a pipeline de deploy:
  # https://github.com/terraform-aws-modules/terraform-aws-ecs/blob/master/docs/README.md#service-1

  container_image = "docker.io/library/nginx"
  image_tag       = "latest"
  container_api_port = 80
}

inputs = {
  name        = "${local.project_name}-${local.environment}-sos_rs_backend"
  cluster_arn = dependency.ecs_cluster.outputs.arn

  # cpu    = 2048
  # memory = 4096

  enable_execute_command = true

  # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html
  container_definitions = {
    sos-rs-backend = {

      # cpu       = 512
      # memory    = 1024

      memory_reservation = 100

      essential = true
      image     = "${local.container_image}:${local.image_tag}"
      port_mappings = [
        {
          name          = "api"
          containerPort = local.container_api_port
          protocol      = "tcp"
        }
      ]

      readonly_root_filesystem = true
      enable_cloudwatch_logging = true
    }
  }

  subnet_ids = dependency.vpc.outputs.private_subnets

  load_balancer = {}

  security_group_rules = {
    alb_ingress_api = {
      type                     = "ingress"
      from_port                = local.container_api_port
      to_port                  = local.container_api_port
      protocol                 = "tcp"
      description              = "Porta para a API"
      source_security_group_id = ""
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

