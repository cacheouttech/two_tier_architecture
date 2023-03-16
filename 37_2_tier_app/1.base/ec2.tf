module "my_ec2" {
  count            = 2
  source           = "../modules/ec2"
  ec2_name         = "my-ec2-instance-${count.index + 1}"
  ami_id           = "ami-0dfcb1ef8550277af"
  instance_type    = "t2.micro"
  subnet_id        = module.my_vpc.private_subnet_ids[count.index]
  vpc_id           = module.my_vpc.vpc_id
  user_data        = file("user_data.sh")
  security_groups  = aws_security_group.allow_ec2.id
  key_name         = "" ### NAME OF THE KEY YOU CREATED FROM THE PREREQUESITS STEP
  root_volume_size = 20

  depends_on = [module.my_vpc, module.my_rds]
}