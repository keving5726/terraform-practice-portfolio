output "config" {
  description = "S3 backend configuration"
  value = {
    bucket   = aws_s3_bucket.tf_backend.bucket
    region   = data.aws_region.current.region
    role_arn = aws_iam_role.tf_backend.arn
  }
}
