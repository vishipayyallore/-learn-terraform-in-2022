resource "aws_security_group" "sg_for_elb" {

  name        = "Security Group for ELB"
  description = "Allow incoming HTTP traffic from the internet"
  vpc_id      = aws_vpc.vpc_for_web.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_for_web" {

  name        = "Security Group for Web Server"
  description = "Allow HTTP traffic from ELB security group"
  vpc_id      = aws_vpc.vpc_for_web.id

  # HTTP access from the VPC
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_for_elb.id}"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
