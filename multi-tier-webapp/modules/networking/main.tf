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

module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "web-server-sg"
  description = "Security group for allow traffic to the web server on port ${var.web_server_port} and SSH"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["${var.private_network_cidr}"]
  ingress_rules       = ["ssh-tcp"]
  ingress_with_source_security_group_id = [
    {
      rule                     = "http-8080-tcp"
      description              = "Allow traffic to the port ${var.web_server_port}"
      source_security_group_id = module.alb_sg.security_group_id
    }
  ]

  tags = {
    Name = "Web Server SG"
  }
}

module "database_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "database-sg"
  description = "Security group to allow traffic from web server to the database"
  vpc_id      = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      description              = "Allow traffic to the port 3306"
      source_security_group_id = module.web_server_sg.security_group_id
    }
  ]

  tags = {
    Name = "Database SG"
  }
}
