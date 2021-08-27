variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}
variable "number_of_private_subnets" {
  type = number 
  default = 1
  description = "The number of private subnets in a VPC."
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

variable "main_pvt_route_table_id" {
  type        = string
  description = "Main route table id"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}