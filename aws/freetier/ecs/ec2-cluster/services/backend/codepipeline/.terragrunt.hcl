# https://registry.terraform.io/modules/cloudposse/ecs-codepipeline/aws

terraform {
  source = "tfr:///cloudposse/ecs-codepipeline/aws?version=0.34.0"
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

dependency "ecs_service" {
  config_path = "../service"
}

dependency "alb" {
  config_path = "../alb"
}

dependency "ecr_repo" {
  config_path = "../ecr-repo"
}

inputs = {
  ecs_cluster_name = dependency.ecs_cluster.outputs.name 
  service_name = dependency.ecs_service.outputs.name

  # github_oauth_token =""
  poll_source_changes = true
  repo_owner = "ppastorf"
  repo_name = "sos-rs-backend"
  branch = "main"
  
  # build_image = ""

  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#vpc_config
  # codebuild_vpc_config =""

  # build_compute_type = "" # `BUILD_GENERAL1_SMALL` `BUILD_GENERAL1_MEDIUM` `BUILD_GENERAL1_LARGE`
  # build_timeout = 60  #       = number
  # buildspec = ""

  region = include.env.locals.region
  aws_account_id = include.env.locals.account_id

  # image_repo_name = ""
  # image_tag = ""
}

_xM|}QzboIt-#8xaQk[RzA$%oCPO
