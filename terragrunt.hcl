remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "node-terraform-up-and-running-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region  = local.local_inputs.region,
    profile = local.local_inputs.profile
    encrypt = true
    dynamodb_table = "node-terraform-up-and-running-locks-table"
  }
}

locals {
  local_inputs  = yamldecode(file("${get_terragrunt_dir()}/inputs.yml"))
  global_inputs = yamldecode(file("${get_terragrunt_dir()}/inputs.yml"))
}

inputs = merge(local.global_inputs, local.local_inputs)