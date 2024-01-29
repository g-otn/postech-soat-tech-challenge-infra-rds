resource "aws_dynamodb_table" "identification_svc_clients_table" {
  name         = "clients"
  billing_mode = "PROVISIONED"

  hash_key = "id" // Partition key

  read_capacity  = "5"
  write_capacity = "5"

  attribute {
    name = "id"
    type = "S" // Auto-generated UUIDs
  }

  tags = {
    Name : "SOAT-TC DynamoDB Identification Service Clients Table"
  }
}

module "identification_svc_clients_table_autoscaling" {
  source     = "snowplow-devops/dynamodb-autoscaling/aws"
  version    = "~> 0.2.1"
  table_name = aws_dynamodb_table.identification_svc_clients_table.name
}

resource "aws_dynamodb_table" "production_svc_status_table" {
  name         = "status"
  billing_mode = "PROVISIONED"

  hash_key = "id" // Partition key

  read_capacity  = "5"
  write_capacity = "5"

  attribute {
    name = "id"
    type = "S" // Auto-generated UUIDs
  }

  tags = {
    Name : "SOAT-TC DynamoDB Production Service Status Table"
  }
}

module "production_svc_status_table_autoscaling" {
  source     = "snowplow-devops/dynamodb-autoscaling/aws"
  version    = "~> 0.2.1"
  table_name = aws_dynamodb_table.production_svc_status_table.name
}
