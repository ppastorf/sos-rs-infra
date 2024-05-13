locals {
  project_name   = "sos_rs"
  default_region = "sa-east-1"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.project_name}-tfstate"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.default_region}"
    encrypt        = true
    dynamodb_table = "${local.project_name}-tfstate-locktable"
  }
}

