inputs = {
  environment    = "staging"
  app_count      = 1
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "../..//infrastructure-modules"
  extra_arguments "conditional_vars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-lock-timeout=10m",
      "-var", "module=${path_relative_to_include()}"
    ]
    required_var_files = [
      "${get_parent_terragrunt_dir()}/sensitive.tfvars"
    ]
  }
}
