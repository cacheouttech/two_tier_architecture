# output variables to expose RDS endpoint, username, and password
output "rds_endpoint" {
  value = module.my_rds.rds_endpoint
}

output "rds_username" {
  value = module.my_rds.rds_username
}

output "rds_password" {
  value     = module.my_rds.rds_password
  sensitive = true
}

output "rds_database" {
  value = module.my_rds.rds_database
}