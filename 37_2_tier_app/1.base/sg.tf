resource "aws_security_group" "allow_rds" {
  name        = "allow_rds"
  description = "Allow RDS inbound traffic"
  vpc_id      = module.my_vpc.vpc_id

  ingress {
    description     = "RDS from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ec2.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rds"
  }
}

resource "aws_security_group" "allow_ec2" {
  name        = "allow_ec2"
  description = "Allow ec2 inbound traffic"
  vpc_id      = module.my_vpc.vpc_id

  ingress {
    description     = "EC2 from Internet"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ec2"
  }
}