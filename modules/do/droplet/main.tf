resource "digitalocean_droplet" "this" {
  image     = var.image
  name      = var.name
  vpc_uuid = var.vpc_id
  region    = var.region
  size      = var.size
  user_data = var.user_data
  ssh_keys  = [data.digitalocean_ssh_key.this.fingerprint]
  monitoring = var.monitoring_enabled
  graceful_shutdown = var.graceful_shutdown
  ipv6 = var.ipv6_enabled
}

# ssh key
data "digitalocean_ssh_key" "this" {
  name = var.ssh_key_name
}

# volume
resource "digitalocean_volume" "this" {
  count                    = var.attach_volume ? 1 : 0

  region                   = var.region
  name                     = "${var.name}-volume"
  size                     = var.attach_volume_size
  initial_filesystem_type  = var.attach_volume_initial_filesystem_type
  initial_filesystem_label = var.attach_volume_initial_filesystem_label
}

resource "digitalocean_volume_attachment" "this" {
  count = var.attach_volume ? 1 : 0

  droplet_id = digitalocean_droplet.this.id
  volume_id  = digitalocean_volume.this[0].id
}

# floating ip
resource "digitalocean_floating_ip" "this" {
  count  = var.floating_ip_enabled == true ? 1 : 0
  region = var.region
}

resource "digitalocean_floating_ip_assignment" "floating_ip" {
  count  = var.floating_ip_enabled == true ? 1 : 0

  ip_address = digitalocean_floating_ip.this[0].ip_address
  droplet_id = digitalocean_droplet.this.id
}

# reserved ip
resource "digitalocean_reserved_ip" "this" {
  count  = var.reserved_ip_enabled == true ? 1 : 0

  droplet_id = digitalocean_droplet.this.id
  region     = var.region
}

resource "digitalocean_reserved_ip_assignment" "example" {
  count  = var.reserved_ip_enabled == true ? 1 : 0

  ip_address = digitalocean_reserved_ip.this[0].ip_address
  droplet_id = digitalocean_droplet.this.id
}

# firewall
resource "digitalocean_firewall" "default" {
  count       = var.firewall_enabled ? 1 : 0
  name        = var.name
  droplet_ids = [digitalocean_droplet.this.id]

  dynamic "inbound_rule" {
    for_each = var.firewall_inbound_rules
    content {
      protocol           = lookup(inbound_rule.value, "protocol", null)
      port_range         = lookup(inbound_rule.value, "port_range", null)
      source_addresses   = lookup(inbound_rule.value, "source_addresses", null)
      source_droplet_ids = lookup(inbound_rule.value, "source_droplet_ids", null)
    }
  }
  
  dynamic "outbound_rule" {
    for_each = var.firewall_outbound_rules
    content {
      protocol                = lookup(outbound_rule.value, "protocol", null)
      port_range              = lookup(outbound_rule.value, "port_range", null)
      destination_addresses   = lookup(outbound_rule.value, "destination_addresses", null)
      destination_droplet_ids = lookup(outbound_rule.value, "destination_droplet_ids", null)
    }
  }
}
