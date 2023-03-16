resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  user_data       = var.user_data
  security_groups = [var.security_groups]
  key_name        = var.key_name
  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = {
    Name = var.ec2_name
  }
}
