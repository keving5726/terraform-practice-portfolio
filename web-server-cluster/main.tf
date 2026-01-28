data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_security_group" "web_server_ec2_sg" {
  name        = var.sg_name
  description = "Security group to allow traffic to the web server on port ${var.server_port}"

  tags = {
    Name = "Web Server EC2 SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4" {
  security_group_id = aws_security_group.web_server_ec2_sg.id

  cidr_ipv4   = var.sg_cidr_ipv4
  from_port   = var.server_port
  ip_protocol = var.sg_ip_protocol
  to_port     = var.server_port
}

resource "aws_launch_template" "ubuntu" {
  name                   = "UbuntuNobleNumbat"
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  description            = "Ubuntu template used for the web server cluster"
  vpc_security_group_ids = [aws_security_group.web_server_ec2_sg.id]
  monitoring {
    enabled = false
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Congratulations, the web server is working successfully" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  )
}
