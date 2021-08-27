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
