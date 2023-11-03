variable "repo_owner" {
  type    = string
  default = "soat-tech-challenge"
}

variable "repository" {
  type    = string
  default = "soat-tech-challenge/terraform-aws-rds"
}

variable "db_port" {
  description = "Porta da instância RDS"
  type        = string
  default     = "5432"
}

variable "db_username" {
  description = "Nome de usuário do banco de dados"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default     = "postgres"
}

variable "aws_region" {
  description = "Região AWS onde criar a instância RDS"
  type        = string
  default     = "us-east-2"
}

variable "AWS_ACCESS_KEY" {
  description = "AWS Access Key"
  type        = string
}

variable "AWS_SECRET_KEY" {
  description = "AWS Secret Key"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "soat-tech-challenge-vpc"
}
