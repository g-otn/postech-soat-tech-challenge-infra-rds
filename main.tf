

resource "aws_db_parameter_group" "this" {
  name   = "soat-tc-rds-parameter-group"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "this" {
  identifier = "soat-tc-rds-db"
  engine     = "postgres"

  allocated_storage = 20
  storage_type      = "gp2"
  engine_version    = "15.3"
  instance_class    = "db.t3.micro"

  username = var.db_username
  password = var.db_password
  port     = var.db_port

  skip_final_snapshot = true
  publicly_accessible = true # TODO: set to false after testing
  deletion_protection = false
  ca_cert_identifier  = "rds-ca-rsa2048-g1"
  apply_immediately   = true

  parameter_group_name = aws_db_parameter_group.this.name
  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [aws_security_group.this.id]
}
