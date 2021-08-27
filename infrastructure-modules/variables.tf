variable "module" {
  description = "The terraform module used to deploy"
  type        = string
}
variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
}
variable "app_name" {
  description = "The name of the app"
  type = string
}

variable "environment" {
  description = "Applicaiton environment"
  type = string
}

variable "app_port" {
  description = "Application port"
  type = number
}