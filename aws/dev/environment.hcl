locals {
  project_name = "sos-rs"
  environment  = "dev"
  region       = "sa-east-1"
  account_id   = "339713018519"
  env_prefix   = "${local.project_name}-${local.environment}"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.env_prefix}-tfstate"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.region}"
    encrypt        = true
    dynamodb_table = "${local.env_prefix}-tfstate-locktable"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
  allowed_account_ids = [${local.account_id}] 
  default_tags {
    tags = {
      Project = "${local.project_name}"
      Environment = "${local.environment}"
      Managed-By = "Terraform"
    } 
  }
}
EOF
}

