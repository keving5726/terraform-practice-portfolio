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

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t4g.micro"
}
