data "aws_region" "current" {}

resource "random_string" "rand" {
  length  = 24
  special = false
  upper   = false
}
