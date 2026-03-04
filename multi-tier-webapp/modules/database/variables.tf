variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable "sg" {
  type = any
}

variable "db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t4g.micro"
}
