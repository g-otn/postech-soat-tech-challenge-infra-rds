output "db_instance_username" {
  description = "The RDS instance ID"
  value       = aws_db_instance.soat_postgres_db.username
}