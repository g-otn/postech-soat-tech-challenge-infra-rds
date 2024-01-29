resource "aws_security_group" "order_svc_rds_db_sg" {
  name   = "SOAT-TC RDS Order Service DB Security Group"
  vpc_id = data.tfe_outputs.network.values.vpc_vpc.id

  ingress {
    from_port   = var.order_svc_db_port
    to_port     = var.order_svc_db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "payment_svc_rds_db_sg" {
  name   = "SOAT-TC RDS Payment Service DB Security Group"
  vpc_id = data.tfe_outputs.network.values.vpc_vpc.id

  ingress {
    from_port   = var.payment_svc_db_port
    to_port     = var.payment_svc_db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "soat-tc-rds-public-subnets-subnet-group"
  subnet_ids = data.tfe_outputs.network.values.vpc_public_subnets[*].id

  tags = {
    Name : "SOAT-TC RDS Public Subnets Subnet Group"
  }
}

