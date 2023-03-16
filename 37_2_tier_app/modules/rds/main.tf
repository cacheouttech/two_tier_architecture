resource "aws_db_instance" "rds" {
  identifier        = var.identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  multi_az          = var.multi_az
  username          = var.username
  password          = var.password
  db_name           = var.db_name

  db_subnet_group_name = aws_db_subnet_group.default.name
}

resource "aws_db_subnet_group" "default" {
  name       = "rds"
  subnet_ids = var.subnet_ids
}