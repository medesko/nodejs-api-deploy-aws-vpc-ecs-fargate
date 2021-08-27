# VPC for ECS Fargate
module "vpc_for_ecs_fargate" {
  source = "./vpc"
  vpc_tag_name = "${var.app_name}-vpc"
  number_of_private_subnets = 2
  private_subnet_tag_name = "${var.app_name}-private-subnet"
  route_table_tag_name = "${var.app_name}-rt"
  environment = var.environment
  security_group_lb_name = "${var.app_name}-alb-sg"
  security_group_ecs_tasks_name = "${var.app_name}-ecs-tasks-sg"
  app_port = var.app_port
  main_pvt_route_table_id = var.main_pvt_route_table_id
  availability_zones = var.availability_zones
  region = var.region
}