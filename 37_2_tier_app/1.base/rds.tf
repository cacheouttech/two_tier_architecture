module "my_rds" {
  source = "../modules/rds"

  identifier        = "rds-instance"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
  storage_type      = "gp2"
  multi_az          = true
  username          = "admin"
  password          = "password"
  db_name           = "database"

  subnet_ids             = [module.my_vpc.private_subnet_ids[0], module.my_vpc.private_subnet_ids[1]]
  vpc_security_group_ids = aws_security_group.allow_rds.id

  depends_on = [module.my_vpc]
}