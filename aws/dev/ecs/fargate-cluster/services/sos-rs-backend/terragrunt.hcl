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

dependency "alb" {
  config_path = "./alb"
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment

  # consideracao importante ao montar a pipeline de deploy:
  # https://github.com/terraform-aws-modules/terraform-aws-ecs/blob/master/docs/README.md#service-1

  container_name  = "sos-rs-backend"
  container_image = "docker.io/library/nginx"
  image_tag       = "latest"
  container_api_port = 80
}

inputs = {
  name        = "${local.project_name}-${local.environment}-sos_rs_backend"
  cluster_arn = dependency.ecs_cluster.outputs.arn

  # deve ser maior que o maximo possivel usado por todos os possiveis containers, e uma das configuracoes:
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-tasks-services.html#fargate-tasks-size
  cpu    = 2048
  memory = 4096

  enable_autoscaling = true
  autoscaling_min_capacity = 1
  autoscaling_max_capacity = 4

  enable_execute_command = true
  launch_type = "FARGATE"

  # ignore_task_definition_changes = true

  # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html
  container_definitions = {
    (local.container_name) = {
      image = "${local.container_image}:${local.image_tag}"

      # command = []
      # environment = []

      # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_Secret.html
      # secrets = [] 

      # cpu    = 512
      # memory = 1024
      # memory_reservation = 512

      port_mappings = [
        {
          containerPort = local.container_api_port
          protocol      = "tcp"
        }
      ]

      readonly_root_filesystem = false
      enable_cloudwatch_logging = true
    }
  }

  assign_public_ip = false
  subnet_ids = dependency.vpc.outputs.private_subnets

  load_balancer = {
    service = {
      target_group_arn = dependency.alb.outputs.target_groups.ecs-http.arn
      container_name   = local.container_name
      container_port   = local.container_api_port
    }
  }

  security_group_rules = {
    ingress_http = {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [dependency.vpc.outputs.vpc_cidr_block]
    },
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

