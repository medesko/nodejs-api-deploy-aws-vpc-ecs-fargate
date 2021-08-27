resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_tag_name}-${var.environment}"
  }
}

### ------------VPC Network Setup ----------------------###

# Create the private subnets
resource "aws_subnet" "private_subnet" {
  count = var.number_of_private_subnets
  vpc_id            = "${aws_vpc.custom_vpc.id}"
  cidr_block = "${element(var.private_subnet_cidr_blocks, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = {
    Name = "${var.private_subnet_tag_name}-${var.environment}"
  }
}

### Security Group Setup

# ALB Security group
resource "aws_security_group" "lb" {
  name        = "${var.security_group_lb_name}-${var.environment}"
  description = var.security_group_lb_description
  vpc_id      = "${aws_vpc.custom_vpc.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
