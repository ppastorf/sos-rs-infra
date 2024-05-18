# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/records?version=2.11.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "zone" {
  config_path = "../../../route53/sos-rs-freetier.com/zone"
}

dependency "instance" {
  config_path = "../instance"
}

# jumpbox-instance.sos-rs-freetier.com

inputs = {
  zone_id = values(dependency.zone.outputs.route53_zone_zone_id)[0]
  records = [
    {
      name  = "jumpbox-instance"
      type  = "A"
      ttl = 300
      records = [dependency.instance.outputs.public_ip]
    }
  ]
}

