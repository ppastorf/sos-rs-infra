terraform {
  source = "../../../../../modules/magalu/vpc"
}

include "env" {
  path = find_in_parent_folders()
  expose = true
}

inputs = {
    name = "vpc"
    description = "vpc"
}
