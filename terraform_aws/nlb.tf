# Create a load balancer
resource "aws_lb" "test_nlb" {
  name                             = "test-nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = aws_subnet.private_subnet.*.id
  enable_cross_zone_load_balancing = true
  idle_timeout                     = 600
  tags = {
    Name = "terraform_network_lb"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test_nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.nlb-target-group.arn
  }
}

resource "aws_alb_target_group" "nlb-target-group" {
  name        = "target-groups-web"
  port        = 80
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = aws_vpc.test_vpc.id

  tags = {
    name = "web-target-groupe"
  }
}

resource "aws_alb_target_group_attachment" "test" {
  count            = 2 #This can be passed as variable.
  target_group_arn = aws_alb_target_group.nlb-target-group.arn
  target_id        = element(split(",", join(",", aws_instance.webservers.*.id)), count.index)
}
