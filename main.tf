resource "aws_security_group" "soat_rds_security_group" {
  name   = "soat-rds-security-group"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "soat_rds_subnet_group" {
  name       = "soat-rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "soat_rds_parameter_group" {
  name   = "soat-rds-parameter-group"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "soat_rds_postgres_db" {
  identifier = "soat-rds-postgres-db"
  engine     = "postgres"

  allocated_storage = 20
  storage_type      = "gp2"
  engine_version    = "15.3"
  instance_class    = "db.t3.micro"

  username = var.db_username
  password = var.db_password
  port     = var.db_port

  skip_final_snapshot = true
  publicly_accessible = false
  deletion_protection = false

  parameter_group_name = aws_db_parameter_group.soat_rds_parameter_group.name
  db_subnet_group_name = aws_db_subnet_group.soat_rds_subnet_group.name

  vpc_security_group_ids = [aws_security_group.soat_rds_security_group.id]
}
