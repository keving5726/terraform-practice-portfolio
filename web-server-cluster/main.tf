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

resource "aws_security_group" "web_server_sg" {
  name        = var.sg_name
  description = "Security group to allow traffic to the web server on port ${var.web_server_port}"

  tags = {
    Name = "Web Server SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id

  cidr_ipv4   = var.sg_cidr_ipv4
  from_port   = var.web_server_port
  ip_protocol = var.sg_ip_protocol
  to_port     = var.web_server_port
}

resource "aws_launch_template" "ubuntu" {
  name                   = "UbuntuNobleNumbat"
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  description            = "Ubuntu template used for the web server cluster"
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  monitoring {
    enabled = false
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Congratulations, the web server is working successfully" > index.html
              nohup busybox httpd -f -p ${var.web_server_port} &
              EOF
  )
}
