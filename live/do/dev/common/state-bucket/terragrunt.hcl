terraform {
  source = "${get_repo_root()}/modules/do/spaces-bucket"
}

include "env" {
  path   = find_in_parent_folders()
  expose = true
}

skip = true

inputs = {
  spaces = [{
    "name"          = "${include.env.locals.env_prefix}-tfstate"
    "region"        = include.env.locals.region
    "acl"           = "private"
    "force_destroy" = true
    "versioning" = {
      "enabled" = false
    }
  }]
}
