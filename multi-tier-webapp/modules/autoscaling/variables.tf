variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "vpc" {
  description = "Reference to the VPC module outputs"
  type        = any
}

variable "sg" {
  description = "Security group IDs for the Application Load Balancer, web server, and database"
  type        = any
}

variable "db_config" {
  description = "Connection details for the database configuration"
  type = object({
    hostname = string
    port     = number
    database = string
    user     = string
    password = string
  })
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  default     = null
  type        = string
}
