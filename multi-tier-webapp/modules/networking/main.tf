data "aws_region" "current" {}

locals {
  azs = formatlist("${data.aws_region.current.region}%s", ["a", "b", "c"])
}
