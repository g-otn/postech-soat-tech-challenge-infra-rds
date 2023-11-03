output "rds_instance_id" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.soat_tc_rds_db.identifier
}
