# https://registry.terraform.io/modules/terraform-do-modules/firewall/digitalocean/latest

terraform {
  source = "tfr:///terraform-do-modules/firewall/digitalocean?version=1.0.0"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/common/vpc"
}

inputs = {
  name   = "${include.env.locals.env_prefix}-backend-droplet-firewall"
  environment        = include.env.locals.environment
  vpc_id = dependency.vpc.outputs.id

  droplet_ids        = []
  kubernetes_ids     = []
  load_balancer_uids = []

  rules = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["177.76.55.253/32"]
    },
    {
      protocol         = "udp"
      port_range       = "51280"
      source_addresses = ["177.76.55.253/32"]
    }
  ]
  outbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "1-65535"
      destination_addresses = ["::/0"]
    },
    {
      protocol         = "udp"
      port_range       = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },
    {
      protocol         = "udp"
      port_range       = "1-65535"
      destination_addresses = ["::/0"]
    },
  ]
}
