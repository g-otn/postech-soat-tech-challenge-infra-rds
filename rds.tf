resource "aws_db_parameter_group" "main" {
  name        = "soat-tc-psql-pg"
  description = "SOAT Tech Challenge RDS Parameter Group for PostgreSQL"
  family      = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  tags = {
    Name : "SOAT-TC RDS PostgreSQL Parameter Group"
  }
}

resource "aws_db_instance" "order_svc_db" {
  identifier = "soat-tc-rds-order-svc-db"
  engine     = "postgres"

  db_name = var.order_svc_db_name

  allocated_storage = 20
  storage_type      = "gp2"
  engine_version    = "15.4"
  instance_class    = "db.t3.micro"

  username = var.order_svc_db_username
  password = var.order_svc_db_password
  port     = var.order_svc_db_port

  skip_final_snapshot = true
  publicly_accessible = true # For presentation purposes
  deletion_protection = false
  ca_cert_identifier  = "rds-ca-rsa2048-g1"
  apply_immediately   = true

  parameter_group_name = aws_db_parameter_group.main.name
  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [aws_security_group.order_svc_rds_db_sg.id]

  # monitoring_interval = 15
  # monitoring_role_arn = data.aws_iam_role.lab_role.arn
}

resource "aws_db_instance" "payment_svc_db" {
  identifier = "soat-tc-rds-payment-svc-db"
  engine     = "postgres"

  db_name = var.payment_svc_db_name

  allocated_storage = 20
  storage_type      = "gp2"
  engine_version    = "15.4"
  instance_class    = "db.t3.micro"

  username = var.payment_svc_db_username
  password = var.payment_svc_db_password
  port     = var.payment_svc_db_port

  skip_final_snapshot = true
  publicly_accessible = true # For presentation purposes
  deletion_protection = false
  ca_cert_identifier  = "rds-ca-rsa2048-g1"
  apply_immediately   = true

  parameter_group_name = aws_db_parameter_group.main.name
  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [aws_security_group.payment_svc_rds_db_sg.id]

  # monitoring_interval = 15
  # monitoring_role_arn = data.aws_iam_role.lab_role.arn
}
