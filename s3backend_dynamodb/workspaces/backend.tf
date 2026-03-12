terraform {
  backend "s3" {
    bucket  = ""
    key     = ""
    encrypt = true

    region = ""

    dynamodb_table = ""

    assume_role = {
      role_arn = ""
    }
  }
}
