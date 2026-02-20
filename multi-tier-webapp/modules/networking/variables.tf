variable "namespace" {
  type = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "database_subnets" {
  description = "List of database subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
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

variable "allow_all_cidr" {
  description = "CIDR block that allows all incoming and outgoing traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "private_network_cidr" {
  description = "CIDR block for a private network range"
  type        = string
  default     = "10.0.0.0/16"
}
