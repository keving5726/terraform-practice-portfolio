variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "aws_region" {
  description = "AWS Region where the instance will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.nano"
}
