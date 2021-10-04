remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "node-terraform-up-and-running-state-${local.local_inputs.environment}"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region  = local.local_inputs.region,
    profile = local.local_inputs.profile
    encrypt = true
    dynamodb_table = "node-terraform-up-and-running-locks-table"
  }
}

locals {
  local_inputs  = jsondecode(file("${get_terragrunt_dir()}/inputs.json"))
  global_inputs  = jsondecode(file("${get_parent_terragrunt_dir()}/inputs.json"))
}

inputs = merge(local.global_inputs, local.local_inputs)