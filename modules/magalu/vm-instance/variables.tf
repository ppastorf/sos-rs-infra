variable "name" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "image" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "associate_public_ip" {
    type = bool
}

variable "ssh_key_name" {
    type = bool
}

variable "create_public_ip" {
    type = bool
}