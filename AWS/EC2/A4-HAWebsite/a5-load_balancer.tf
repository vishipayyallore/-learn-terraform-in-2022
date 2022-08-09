resource "aws_elb" "web" {

  name            = "web-elb"
  subnets         = ["${aws_subnet.subnet_for_public.*.id}"]
  security_groups = ["${aws_security_group.sg_for_elb.id}"]
  instances       = ["${aws_instance.ec2_for_web.*.id}"]

  # Listen for HTTP requests and distribute them to the instances
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  # Check instance health every 10 seconds
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }

}
