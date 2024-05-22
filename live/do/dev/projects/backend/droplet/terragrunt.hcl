# https://registry.terraform.io/modules/terraform-do-modules/firewall/digitalocean/latest

terraform {
  source = "./module"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/common/vpc"
}

// ip_publikc =
// ip_privada =  
// id = 

inputs = {
  image = "ubuntu-20-04-x64"
  name = "shshga"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = ["42129407"]
  user_data =<<EOF
apt-get install wireguard wireguard-tools
sudo su -
cd /etc/wireguard
wg genkey | tee privatekey | wg pubkey > publickey
EOF
}
