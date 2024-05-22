resource "digitalocean_droplet" "fodazer" {
  image     = var.image
  name      = var.name
  region    = var.region
  size      = var.size
  user_data = var.user_data
  ssh_keys  = var.ssh_keys 
}

output "ip_publikc" {
    value = digitalocean_droplet.fodazer.ipv4_address
}

output "ip_privada" {
    value = digitalocean_droplet.fodazer.ipv4_address_private
}
# ipv6nem existe kkk

output "id" {
    value = digitalocean_droplet.fodazer.id
}

variable "image" {
  type = string
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "size" {
  type = string
}

variable "user_data" {
  type = string
}

variable "ssh_keys" {
  type = list(string)
}
