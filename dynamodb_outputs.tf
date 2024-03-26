output "dynamodb_identification_svc_status_table" {
  description = "DynamoDB Identification Service Clients Table"
  value = {
    "arn" : aws_dynamodb_table.identification_svc_clients_table.arn,
    "id" : aws_dynamodb_table.identification_svc_clients_table.id,
    "name" : aws_dynamodb_table.identification_svc_clients_table.name,
    "tags" : aws_dynamodb_table.identification_svc_clients_table.tags,
  }
}

output "dynamodb_production_svc_status_table" {
  description = "DynamoDB Production Service Status Table"
  value = {
    "arn" : aws_dynamodb_table.production_svc_status_table.arn,
    "id" : aws_dynamodb_table.production_svc_status_table.id,
    "name" : aws_dynamodb_table.production_svc_status_table.name,
    "tags" : aws_dynamodb_table.production_svc_status_table.tags,
  }
}
