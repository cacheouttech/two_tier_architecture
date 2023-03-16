resource "aws_lb_target_group" "tg" {
  name_prefix = "asg-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.my_vpc.vpc_id
}

resource "aws_autoscaling_attachment" "asg_att" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  alb_target_group_arn   = aws_lb_target_group.tg.arn
}