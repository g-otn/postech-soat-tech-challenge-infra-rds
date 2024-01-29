output "order_svc_db" {
  value = {
    "address" : aws_db_instance.order_svc_db.address
    "arn" : aws_db_instance.order_svc_db.arn
    "availability_zone" : aws_db_instance.order_svc_db.availability_zone
    "endpoint" : aws_db_instance.order_svc_db.endpoint
    "id" : aws_db_instance.order_svc_db.id
    "resource_id" : aws_db_instance.order_svc_db.resource_id
    "tags" : aws_db_instance.order_svc_db.tags
    "vpc_security_group_ids" : aws_db_instance.order_svc_db.vpc_security_group_ids
  }
}

output "payment_svc_db" {
  value = {
    "address" : aws_db_instance.payment_svc_db.address
    "arn" : aws_db_instance.payment_svc_db.arn
    "availability_zone" : aws_db_instance.payment_svc_db.availability_zone
    "endpoint" : aws_db_instance.payment_svc_db.endpoint
    "id" : aws_db_instance.payment_svc_db.id
    "resource_id" : aws_db_instance.payment_svc_db.resource_id
    "tags" : aws_db_instance.payment_svc_db.tags
    "vpc_security_group_ids" : aws_db_instance.payment_svc_db.vpc_security_group_ids
  }
}
