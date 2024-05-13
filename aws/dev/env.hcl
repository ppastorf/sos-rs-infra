locals {
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl")).locals
  environment = "dev"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.project_vars.default_region}"
  default_tags {
    tags = {
      Project = "${local.project_vars.project_name}"
      Environment = "${local.environment}"
      Managed-By = "Terraform"
    }
  }
}
EOF
}

