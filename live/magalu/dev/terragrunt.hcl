locals {
  project_name = "sos-rs"
  environment  = "dev"
  region       = "br-se1" # br-ne1
  // account_id   = ""
  provider     = "mgc"
  env_prefix   = "[${local.project_name}-${local.environment}-${local.provider}"
}

# mgc --region br-se1 object-storage buckets create sos-rs-mgc-dev-tfstate --enable-versioning --private

// remote_state {
//   backend = "s3"
//   generate = {
//     path      = "backend.tf"
//     if_exists = "overwrite_terragrunt"
//   }
//   config = {
//     endpoint = ""
//     // skip_bucket_versioning = false
//     bucket         = "${local.env_prefix}-tfstate"
//     key            = "${path_relative_to_include()}/terraform.tfstate"
//     region         = "${local.region}"
//     encrypt        = false
//     dynamodb_table = "${local.env_prefix}-tfstate-locktable"
//   }
// }

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF

terraform {
  required_providers {
    mgc = {
      source = "MagaluCloud/mgc"
      version = "0.18.10"
    }
  }
}

provider "mgc" {
  # Configuration options
}
EOF
}

