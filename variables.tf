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
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet id array"
  type        = set(string)
}
