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
