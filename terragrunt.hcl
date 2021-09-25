remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "node-terraform-up-and-running-state"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "eu-west-3"
    encrypt = true
    dynamodb_table = "node-terraform-up-and-running-locks-table"
  }
}
