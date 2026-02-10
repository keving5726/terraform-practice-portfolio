variable "aws_region" {
  description = "AWS Region where the instance will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t4g.micro"
}

variable "web_server_port" {
  description = "The port the web server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "alb_port" {
  description = "The port the ALB will use for HTTP requests"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol to use for routing traffic"
  type        = string
  default     = "HTTP"
}

variable "instance_sg_name" {
  description = "The name of the security group of the instances"
  type        = string
  default     = "web-server-sg"
}

variable "alb_sg_name" {
  description = "The name of the security group of the Application Load Balancer"
  type        = string
  default     = "alb-sg"
}

variable "ip_protocol" {
  description = "The IP protocol name of the security group"
  type        = string
  default     = "tcp"
}

variable "cidr_ipv4" {
  description = "The source IPv4 CIDR range of the security group"
  type        = string
  default     = "0.0.0.0/0"
}
