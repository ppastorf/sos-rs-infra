# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws

terraform {
  source = "tfr:///terraform-aws-modules/rds/aws?version=6.6.0"
}

include "project" {
  path = find_in_parent_folders("project.hcl")
  expose = true
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

inputs = {
  identifier = "${include.project.locals.project_name}-${include.env.locals.environment}-postgres"

  engine            = "postgres"
  engine_version    = ""
  instance_class    = ""
  allocated_storage = 5

  db_name  = "sos_rs"
  username = ""
  port     = "5432"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = []

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = []

  family = ""
  major_engine_version = ""

  deletion_protection = true

  parameters = [
  ]

  options = [
  ]
}

