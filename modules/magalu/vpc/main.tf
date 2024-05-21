resource "mgc_network_vpcs" "this" {
    name = var.name
    description = var.description
}

variable "name" {
    type = string
}

variable "description" {
    type = string
}
