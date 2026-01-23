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

variable "availability_zone" {
  description = "Availability zone of the instance"
  type        = string
  default     = "us-east-1a"
}
