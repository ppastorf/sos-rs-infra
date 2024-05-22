resource "mgc_network_security_groups" "this" {
    name = var.name
    description = var.description
    validate_quota = var.validate_quota
}

resource "mgc_network_rules" "this" {
    for_each = var.rules
    security_group_id = mgc_network_security_groups.this.id

    direction = var.direction
    ethertype = var.ethertype
    port_range_max = var.port_range_max
    port_range_min = var.port_range_min
    protocol = var.protocol
    remote_group_id = var.remote_group_id
    remote_ip_prefix = var.remote_ip_prefix
    validate_quota = var.validate_quota
    wait = var.wait
}

variable "name" {
    type = string
}

variable "description" {
    type = string
}

# variable "rules" {
#     type = list(object{
#         direction = string
#         ethertype = string
#         port_range_max = number
#         port_range_min = number
#         protocol = string
#         remote_group_id = string
#         remote_ip_prefix = string
#         validate_quota = bool
#         wait = bool 
#     })
#     default = []
# }