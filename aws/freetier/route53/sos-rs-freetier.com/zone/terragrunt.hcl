# https://registry.terraform.io/modules/terraform-aws-modules/route53/aws

terraform {
  source = "tfr:///terraform-aws-modules/route53/aws//modules/zones?version=2.11.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

inputs = {
  zones = {
    "sos-rs-freetier.com" = {}
  }
}

