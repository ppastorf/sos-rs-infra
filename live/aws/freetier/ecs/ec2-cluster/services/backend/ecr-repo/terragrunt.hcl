# https://registry.terraform.io/modules/terraform-aws-modules/ecr/aws

terraform {
  source = "tfr:///terraform-aws-modules/ecr/aws?version=2.2.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

inputs = {
  repository_name = "${include.env.locals.env_prefix}-backend"
  repository_type = "private"

  repository_image_tag_mutability = "IMMUTABLE"
  repository_encryption_type = "AES256"
  repository_image_scan_on_push = false
  create_lifecycle_policy = false
}
