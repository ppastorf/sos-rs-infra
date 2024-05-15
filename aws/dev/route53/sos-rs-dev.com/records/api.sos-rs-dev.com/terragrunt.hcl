# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/records?version=2.11.1"
}

include "env" {
  path = find_in_parent_folders("environment.hcl")
  expose = true
}

dependency "zone" {
  config_path = "../../zone"
}

dependency "target_lb" {
  config_path = "../../../../ecs/fargate-cluster/services/sos-rs-backend/alb"
}

inputs = {
  zone_id   = values(dependency.zone.outputs.route53_zone_zone_id)[0]
  records = [
    {
      name  = "api"
      type  = "A"
      alias = {
        name    = dependency.target_lb.outputs.dns_name
        zone_id = dependency.target_lb.outputs.zone_id
      }
    }
  ]
}

