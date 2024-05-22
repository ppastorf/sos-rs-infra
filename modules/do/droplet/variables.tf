variable "vpc_id" {
  type = string
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
  default = null
}

variable "ssh_key_name" {
  type = string
}

variable "attach_volume" {
    type = bool
    default = false
}

variable "attach_volume_size" {
    type = number
    description = "Em Gb"
    default = 0
}

variable "attach_volume_initial_filesystem_type" {
    type = string
    default = "ext4"
    description = "ext4 ou xfs"
}

variable "attach_volume_initial_filesystem_label" {
    type = string
    default = ""
}

variable "monitoring_enabled" {
  type = bool
  default = false
}

variable "ipv6_enabled" {
  type = bool
  default = false
}

variable "graceful_shutdown" {
  type = bool
  default = false
}

variable "floating_ip_enabled" {
    type = bool
    default = false
}

variable "reserved_ip_enabled" {
    type = bool
    default = false
}

variable "firewall_enabled" {
  type = bool
  default = true
}

variable "firewall_inbound_rules" {
  type = any
  default = [{
    protocol           = "tcp"
    port_range         = "22"
    source_addresses   = ["0.0.0.0/0", "::/0"]
    source_droplet_ids = []
  }]
}

variable "firewall_outbound_rules" {
  type = any
  default = [
    {
      protocol                = "tcp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
      destination_droplet_ids = []
    },
    {
      protocol                = "udp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
      destination_droplet_ids = []
    },
    {
      protocol                = "icmp"
      port_range              = "1-65535"
      destination_addresses   = ["0.0.0.0/0", "::/0"]
      destination_droplet_ids = []
    }
  ]
}
