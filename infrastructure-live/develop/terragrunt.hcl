include {
  path = find_in_parent_folders()
}

terraform {
  source = "../..//infrastructure-modules"
}

locals {
  local_inputs  = jsondecode(file("${get_terragrunt_dir()}/inputs.json"))
  global_inputs  = jsondecode(file("${get_parent_terragrunt_dir()}/inputs.json"))
}

inputs = merge(local.global_inputs, local.local_inputs)