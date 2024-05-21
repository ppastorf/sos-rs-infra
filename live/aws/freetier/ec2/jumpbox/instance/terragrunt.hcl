# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws

terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=5.6.1"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../vpc"
}

dependency "security_group" {
  config_path = "../security-group"
}

locals {
  ami_id = "ami-0cf8f2b5b6c1ac22a" # sa-east-1
  # ami_id = "ami-0e001c9271cf7f3b9" # us-east-1
  ssh_key_name = "sos-rs-dev-jumpbox"
}

inputs = {
  name = "${include.env.locals.env_prefix}-jumpbox"
  instance_type = "t3.micro"

  ami      = local.ami_id
  key_name = local.ssh_key_name

  availability_zone = dependency.vpc.outputs.azs[0]
  subnet_id         = dependency.vpc.outputs.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids = [dependency.security_group.outputs.security_group_id]

  monitoring = true

  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp2"
      volume_size = 8
    },
  ]
}

