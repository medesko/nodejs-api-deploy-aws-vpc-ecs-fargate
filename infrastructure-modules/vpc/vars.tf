variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}
variable "number_of_private_subnets" {
  type = number 
  description = "Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation"
}
variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}
variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}
variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR block which is divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)"
}
variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR block range for the private subnets"
}
variable "environment" {
  type        = string
  description = "Application enviroment"
}
variable "security_group_lb_name" {
  type        = string
  default     = "alb-sg"
  description = "Load Balancer security group name"
}
variable "security_group_lb_description" {
  type        = string
  default     = "controls access to the ALB"
  description = "Load Balancer security group description"
}
variable "region" {
  type = string 
  description = "The AWS region where resources have been deployed"
}
variable "availability_zones" {
  type  = list(string)
  description = "List of availability zones for the selected region"
}