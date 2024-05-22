terraform {
  source = "../../../../../../modules/magalu/vm-instance"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../../../common/vpc"
}

locals {
}

# export TERRAGRUNT_TFPATH=terraform

inputs = {
  name                = "vm1"
  machine_type        = "cloud-bs1.xsmall"
  image               = "cloud-ubuntu-22.04 LTS"
  vpc                 = dependency.vpc.outputs.id
  associate_public_ip = true
  ssh_key_name        = "ssh_mgc"
  // create_public_ip = 
  // user_data = ""
  // state = var.state
  // availability_zone = var.availability_zone

  // user_data = <<EOF
  // EOF
}
