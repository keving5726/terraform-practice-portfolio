variable "aws_region" {
  description = "AWS Region where the instance will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability zone of the instance"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.nano"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "web-server-ec2-sg"
}

variable "sg_ip_protocol" {
  description = "The IP protocol name of the security group"
  type        = string
  default     = "tcp"
}

variable "sg_cidr_ipv4" {
  description = "The source IPv4 CIDR range of the security group"
  type        = string
  default     = "0.0.0.0/0"
}
