# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/records?version=2.11.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "zone" {
  config_path = "../../../../../route53/sos-rs-freetier.com/zone"
}

dependency "alb" {
  config_path = "../alb"
}

# api.sos-rs-freetier.com

inputs = {
  zone_id = values(dependency.zone.outputs.route53_zone_zone_id)[0]
  records = [
    {
      name  = "api"
      type  = "A"
      alias = {
        name    = dependency.alb.outputs.dns_name
        zone_id = dependency.alb.outputs.zone_id
      }
    }
  ]
}

