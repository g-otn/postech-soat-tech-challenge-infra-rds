resource "aws_security_group" "this" {
  name   = "soat-tc-rds-sg"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Backend DB Security Group",
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "soat-tc-rds-subnet-group"
  subnet_ids = data.aws_subnets.private_subnets.ids
}
