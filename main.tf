data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "soat_vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_security_group" "soat_security_group" {
  name   = "soat_security_group"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "soat_security_group"
  }
}

resource "aws_db_subnet_group" "soat_subnet_group" {
  name       = "soat_subnet_group"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "soat_subnet_group"
  }
}

resource "aws_db_parameter_group" "soat_group" {
  name   = "soat-group"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "soat_postgres_db" {

  identifier           = "soat-postgres-db"
  engine               = "postgres"

  allocated_storage    = 20
  storage_type         = "gp2"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"

  username             = var.db_username
  password             = var.db_password
  port                 = var.db_port

  skip_final_snapshot  = true
  publicly_accessible  = true
  deletion_protection  = false

  parameter_group_name   = aws_db_parameter_group.soat_group.name
  vpc_security_group_ids = [aws_security_group.soat_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.soat_subnet_group.name
}
