# https://registry.terraform.io/modules/terraform-do-modules/database/digitalocean

terraform {
  source = "tfr:///terraform-do-modules/database/digitalocean?version=1.0.1"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/common/vpc"
}

locals {
  project = basename(dirname(get_terragrunt_dir())) # parent dir name
}

inputs = {
  name        = "${include.env.locals.env_prefix}-${local.project}-database"
  project_id  = include.env.locals.project_id
  environment = include.env.locals.environment
  region      = include.env.locals.region

  cluster_private_network_uuid = dependency.vpc.outputs.id
  
  # https://slugs.do-api.dev/  
  cluster_engine               = "pg"
  cluster_version              = "16"
  cluster_size                 = "db-s-1vcpu-1gb"
  cluster_node_count           = 1

  storage_size_mib = "10240"
  databases = ["sos_rs_db"]

  // create_pools = true
  // pools = [
  //   {
  //     name    = "test",
  //     mode    = "transaction",
  //     size    = 10,
  //     db_name = "testdb",
  //     user    = "test"
  //   }
  // ]

  create_firewall = true
  firewall_rules = [
    {
      type  = "ip_addr"
      value = include.env.locals.vpc_cidr
    }
  ]
}
