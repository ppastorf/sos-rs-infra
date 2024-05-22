terraform {
  source = "${get_repo_root()}/modules/do/droplet"
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
  name   = "${include.env.locals.env_prefix}-${local.project}-droplet"
  region = include.env.locals.region
  vpc_id = dependency.vpc.outputs.id

  # https://slugs.do-api.dev/
  image = "ubuntu-20-04-x64"
  size = "s-1vcpu-1gb"
  ssh_key_name = "sos-rs"
  graceful_shutdown = true
  attach_volume = false
  monitoring_enabled = true

  firewall_enabled = true
  firewall_inbound_rules = [
    {
      protocol           = "tcp"
      port_range         = "22"
      source_addresses   = ["0.0.0.0/0", "::/0"]
    }
  ]

  firewall_outbound_rules = [
    {
      protocol                = "tcp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol                = "udp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
    }
  ]
}
