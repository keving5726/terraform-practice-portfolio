data "aws_region" "current" {}

locals {
  azs = formatlist("${data.aws_region.current.region}%s", ["a", "b", "c"])
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "${var.namespace}-vpc"
  cidr = var.private_network_cidr

  azs              = local.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "5.3.1"

  name        = "alb-sg"
  description = "Security group to allow traffic to the ALB on port ${var.alb_port}"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.allow_all_cidr

  tags = {
    Name = "Application Load Balancer SG"
  }
}
