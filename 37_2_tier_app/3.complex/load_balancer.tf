resource "aws_lb" "lb" {
  name                       = "public-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.allow_lb.id]
  subnets                    = [module.my_vpc.public_subnet_ids[0], module.my_vpc.public_subnet_ids[1]]
  enable_deletion_protection = true
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}