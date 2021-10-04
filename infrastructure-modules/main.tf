# VPC for ECS Fargate
module "vpc_for_ecs_fargate" {
  source = "./vpc"
  vpc_tag_name = "${var.app_name}-vpc"
  number_of_private_subnets = 2
  private_subnet_tag_name = "${var.app_name}-private-subnet"
  route_table_tag_name = "${var.app_name}-rt"
  region = var.region
  environment = var.environment
  security_group_lb_name = "${var.app_name}-alb-sg"
  availability_zones = var.availability_zones
  vpc_cidr_block = var.vpc_cidr_block
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}