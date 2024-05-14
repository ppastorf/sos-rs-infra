# https://registry.terraform.io/modules/terraform-aws-modules/rds-aurora/aws/

terraform {
  source = "tfr:///terraform-aws-modules/rds-aurora/aws?version=9.3.1"
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
  config_path = "../../vpc"
}

locals {
  project_name = include.project.locals.project_name
  environment  = include.env.locals.environment

  db_name = "${local.project_name}-${local.environment}-backend-pg"
}

inputs = {
  identifier = "${local.db_name}-cluster"
  name       = "${local.db_name}"

  vpc_id                 = dependency.vpc.outputs.vpc_id
  availability_zones     = dependency.vpc.outputs.azs

  subnets                = dependency.vpc.outputs.private_subnets
  create_db_subnet_group = true

  deletion_protection = false # habilitar para prod

  # engine
  engine         = "aurora-postgresql"
  engine_version = "15.4"
  engine_mode    = "provisioned"
  database_name  = "sos_rs_db_dev"

  # acesso
  port = 5432
  enable_http_endpoint = false
  master_username = "postgres"
  iam_database_authentication_enabled = false
  
  # senha
  manage_master_user_password = true
  manage_master_user_password_rotation = true
  master_user_password_rotation_automatically_after_days = 7

  # armazenamento
  storage_encrypted = false   # validar como fazer restore do dump em plaintext para banco encriptado

  # backup
  copy_tags_to_snapshot     = true
  backup_retention_period   = 7     # dias
  delete_automated_backups  = false

  skip_final_snashot = true    # desabilitar para prod
  final_snapshot_identifier = "${local.db_name}-final-snapshot"

  # upgrades
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false

  # instancias, scaling
  # https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html
  instance_class = "db.serverless"

  # valido apenas para engine_mode = "provisioned" (serverless v2)
  # https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless-v2.how-it-works.html
  serverlessv2_scaling_configuration = {
    max_capacity             = 8
    min_capacity             = 2
  }
  
  # security group
  security_group_rules = {
    ingress = {
      type = "ingress"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = [dependency.vpc.outputs.vpc_cidr_block]
    }
    egress = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [dependency.vpc.outputs.vpc_cidr_block]
    }
  }

  # monitoramento
  monitoring_interval = 30

  # logs
  enabled_cloudwatch_logs_exports = ["postgresql"] # "audit", "error", "general", "slowquery", "postgresql"
  create_cloudwatch_log_group     = true
  cloudwatch_log_group_retention_in_days = 7

  # # activity stream
  # create_db_cluster_activity_stream     = true
  # db_cluster_activity_stream_kms_key_id = ""
  # db_cluster_activity_stream_mode       = "async" # sync, async
}

