variable "db_instance_name" {
  description = "Nome da instância RDS"
  type        = string
  default     = "soat_postgres_db"
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

variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "vpc_id" {
  description = "VPC id"
}

variable "subnet_ids" {
  description = "Subnet id array"
}