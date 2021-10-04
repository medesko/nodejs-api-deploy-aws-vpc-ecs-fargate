# variable "module" {
#   description = "The terraform module used to deploy"
#   type        = string
# }
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

variable "availability_zones" {
  type  = list(string)
  description = "List of availability zones for the selected region (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}

variable "app_count" {
  type = string 
  description = "The number of instances of the task definition to place and keep running."
}
variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)"
}
variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR block range for the private subnets"
}
variable "number_of_private_subnets" {
  type = number 
  description = "Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation"
}