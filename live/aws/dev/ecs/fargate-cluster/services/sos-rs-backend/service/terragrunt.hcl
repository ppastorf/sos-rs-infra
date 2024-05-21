# https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest/submodules/service/

terraform {
  source = "tfr:///terraform-aws-modules/ecs/aws//modules/service?version=5.11.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../../../vpc"
}

dependency "ecs_cluster" {
  config_path = "../../../cluster"
}

dependency "alb" {
  config_path = "../alb"
}

# dependency "database" {
#   config_path = "../../../../../rds/backend-db/aurora-cluster"
# }

locals {
  # consideracao importante ao montar a pipeline de deploy:
  # https://github.com/terraform-aws-modules/terraform-aws-ecs/blob/master/docs/README.md#service-1

  container_name  = "sos-rs-backend"
  container_image = "339713018519.dkr.ecr.sa-east-1.amazonaws.com/sos-rs-dev-backend"
  image_tag       = "v0.1.0"

  app_config = {
    port = 80
    host = "0.0.0.0"
  }

  # gerenciado manualmente
  secret_manager_config_arn = "arn:aws:secretsmanager:sa-east-1:339713018519:secret:sos-rs-dev-backend-app-secrets-yIqCSp"
}

inputs = {
  name        = "${include.env.locals.env_prefix}-sos_rs_backend"
  cluster_arn = dependency.ecs_cluster.outputs.arn

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

      # cpu    = 512
      # memory = 1024
      # memory_reservation = 512

      entrypoint = ["sh", "-c"]

      command = [
        "npx prisma generate && npx prisma migrate deploy && npm run build && npm run start:dev"
      ]

      environment = [
        {
          name = "PORT",
          value = local.app_config.port
        },
        {
          name = "HOST",
          value = local.app_config.host
        },
        # {
        #   name = "DB_HOST",
        #   value = dependency.database.outputs.cluster_endpoint
        # },
        # {
        #   name = "DB_PORT",
        #   value = dependency.database.outputs.cluster_port
        # },
        # {
        #   name = "DB_DATABASE_NAME",
        #   value = local.app_config.database_name
        # }
      ]

      secrets = [
        # {
        #   name = "DB_USER",
        #   valueFrom = "${dependency.database.outputs.cluster_master_user_secret.value[0].secret_arn}:username"
        # },
        # {
        #   name = "DB_PASSWORD",
        #   valueFrom = "${dependency.database.outputs.cluster_master_user_secret.value[0].secret_arn}:password"
        # },
        {
          name = "SECRET_KEY",
          valueFrom = "${local.secret_manager_config_arn}:SECRET_KEY::"
        },
        {
          name = "DATABASE_URL",
          valueFrom = "${local.secret_manager_config_arn}:DATABASE_URL::"
        }
      ] 

      port_mappings = [
        {
          containerPort = local.app_config.port
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
      container_port   = local.app_config.port
    }
  }

  security_group_rules = {
    ingress_http = {
      type        = "ingress"
      from_port   = local.app_config.port
      to_port     = local.app_config.port
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

