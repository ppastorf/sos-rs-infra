locals {
}

resource "mgc_virtual-machine_instances" "this" {
    name = var.name

    machine_type = {
        name = var.machine_instances
    }

    image = {
        name = var.image
    }

    network {
        associate_public_ip = true
        vpc = var.vpc_id
    }

    ssh_key_name = var.ssh_key
    state = var.state
    availability_zone = var.availability_zone
    user_data = var.user_data
}

resource "mgc_network_public_ips" "this" {
    count = var.create_public_ip ? 1 : 0
    vpc_id = var.vpc_id

    description = ""
    validate_quota = true
    wait = true
    wait_timeout = "360"
}

resource "mgc_network_public_ips_port" "this" {
    # port_id = var.port_id
    public_ip_id = mgc_network_public_ips.this.id
}

resource "mgc_network_ports_security" "this" {
#   port_id = ""
#   security_group_id = ""
}

resource "mgc_network_ports" "this" {
    # name = 
    vpc_id = var.vpc_id
    has_pip = false
    has_sg = false
    # security_groups_id = []
    # subnets = []
}
