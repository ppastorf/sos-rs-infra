locals {
  project_name = "sos-rs"
  environment  = "dev"
  region       = "nyc3" # https://docs.digitalocean.com/platform/regional-availability/
  project_id   = "b511e8e1-8353-42f0-a229-d3878e7c1cb6" # sos-rs-do-dev
  provider     = "do"
  env_prefix   = "${local.project_name}-${local.provider}-${local.environment}"
  vpc_cidr     = "10.1.0.0/16"
}

// https://github.com/MattMorgis/digitalocean-spaces-terraform-backend/tree/master
// Comentar ao executar o bucket de state
// remote_state {
//   backend = "s3"
//   generate = {
//     path      = "backend.tf"
//     if_exists = "overwrite_terragrunt"
//   }
//   config = {
//     endpoint       = "https://sos-rs-do-dev-tfstate.nyc3.digitaloceanspaces.com"
//     bucket         = "sos-rs-do-dev-tfstate"
//     key            = "${path_relative_to_include()}/terraform.tfstate"
//     region         = "${local.region}"
//     encrypt        = true
//     skip_requesting_account_id  = true
//     skip_credentials_validation = true
//     skip_get_ec2_platforms      = true
//     skip_metadata_api_check     = true
//   }
// }

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "digitalocean" {
  # Configuration options
}
EOF
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "s3" {
    endpoint = "nyc3.digitaloceanspaces.com"
    bucket   = "sos-rs-do-dev-tfstate"
    key      = "${path_relative_to_include()}/terraform.tfstate"
    region   = "us-west-1"
    encrypt  = true
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
EOF
}
