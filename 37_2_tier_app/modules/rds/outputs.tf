# output variables to expose RDS endpoint, username, and password
output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds.username
}

output "rds_password" {
  value = aws_db_instance.rds.password
}

output "rds_database" {
  value = aws_db_instance.rds.db_name
}