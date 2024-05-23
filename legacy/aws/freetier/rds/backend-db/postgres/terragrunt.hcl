# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/

terraform {
  source = "tfr:///terraform-aws-modules/rds/aws?version=6.6.0"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../vpc"
}

dependency "security_group" {
  config_path = "../security-group"
}

inputs = {
  identifier = "${include.env.locals.env_prefix}-backend-db"

  multi_az               = false
  availability_zone      = dependency.vpc.outputs.azs[0]
  subnet_ids             = dependency.vpc.outputs.private_subnets
  create_db_subnet_group = true
  vpc_security_group_ids = [dependency.security_group.outputs.security_group_id]

  # https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "15"
  family               = "postgres15"
  major_engine_version = "15"
  instance_class       = "db.t3.micro"

  # acesso
  db_name                     = "sos_rs_db"
  username                    = "postgres"
  port                        = 5432
  manage_master_user_password = true

  # armazenamento
  allocated_storage = 5
  storage_type      = "gp2"

  # backup
  skip_final_snapshot = true
  deletion_protection = false


  enabled_cloudwatch_logs_exports = ["postgresql"]
  create_cloudwatch_log_group     = true

  # monitoramento
  create_monitoring_role = true
  monitoring_interval    = 60

  # logs
  create_cloudwatch_log_group = true
}

