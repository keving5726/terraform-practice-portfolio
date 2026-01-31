data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_subnet" "default" {
  for_each = toset(data.aws_subnets.default.ids)
  id       = each.value
}

locals {
  allowed_azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

  selected_subnet_ids = [
    for s in data.aws_subnet.default :
    s.id if contains(local.allowed_azs, s.availability_zone)
  ]
}

resource "aws_security_group" "web_server_sg" {
  name        = var.instance_sg_name
  description = "Security group to allow traffic to the web server on port ${var.web_server_port}"

  tags = {
    Name = "Web Server SG"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Security group to allow traffic to the ALB on port ${var.alb_port}"

  tags = {
    Name = "Application Load Balancer SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_server_allow_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  description       = "Allows inbound TCP traffic on port ${var.web_server_port} to enable access to the web server"
  ip_protocol       = var.ip_protocol
  from_port         = var.web_server_port
  to_port           = var.web_server_port
  cidr_ipv4         = var.cidr_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "alb_allow_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  description       = "Allows inbound TCP traffic on port ${var.alb_port} to enable access to the Application Load Balancer"
  ip_protocol       = var.ip_protocol
  from_port         = var.alb_port
  to_port           = var.alb_port
  cidr_ipv4         = var.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  description       = "Allows all outbound IPv4 traffic to any destination, enabling unrestricted egress connectivity"
  ip_protocol       = "-1"
  cidr_ipv4         = var.cidr_ipv4
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id

  cidr_ipv4   = var.sg_cidr_ipv4
  from_port   = var.web_server_port
  ip_protocol = var.sg_ip_protocol
  to_port     = var.web_server_port
}

resource "aws_launch_template" "ubuntu" {
  name          = "UbuntuNobleNumbat"
  description   = "Ubuntu template used for the web server cluster"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  monitoring {
    enabled = false
  }

  network_interfaces {
    security_groups             = [aws_security_group.web_server_sg.id]
    associate_public_ip_address = false
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Congratulations, the web server is working successfully" > index.html
              nohup busybox httpd -f -p ${var.web_server_port} &
              EOF
  )
}
