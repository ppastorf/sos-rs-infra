# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/records?version=2.11.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "zone" {
  config_path = "../../../route53/internal.sos-rs-freetier.com/zone"
}

dependency "database" {
  config_path = "../postgres"
}

# backend-db.internal.sos-rs-freetier.com

inputs = {
  zone_id = values(dependency.zone.outputs.route53_zone_zone_id)[0]
  records = [
    {
      name  = "backend-db"
      type  = "A"
      alias = {
        name    = dependency.database.outputs.db_instance_address
        zone_id = dependency.database.outputs.db_instance_hosted_zone_id
      }
    }
  ]
}

