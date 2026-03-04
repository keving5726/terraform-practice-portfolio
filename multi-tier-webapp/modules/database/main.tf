resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "database" {
  identifier             = "${var.namespace}-db"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.4.7"
  instance_class         = var.db_instance_class
  db_name                = "pets"
  username               = "admin"
  password               = random_password.password.result
  db_subnet_group_name   = var.vpc.database_subnet_group
  vpc_security_group_ids = [var.sg.database]
  multi_az               = false
  skip_final_snapshot    = true
}
