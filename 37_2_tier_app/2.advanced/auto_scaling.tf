resource "aws_launch_template" "lt_for_asg" {
  name_prefix          = "my_scaling_group"
  image_id             = "ami-0dfcb1ef8550277af"
  instance_type        = "t2.micro"
  user_data            = file("user_data.sh")
  security_group_names = [aws_security_group.allow_ec2.name]
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 2
  min_size            = 5
  vpc_zone_identifier = [module.my_vpc.private_subnet_ids[0], module.my_vpc.private_subnet_ids[1]]

  launch_template {
    id      = aws_launch_template.lt_for_asg.id
    version = "$Latest"
  }
}