resource "aws_security_group" "alb_sg" {
  name        = format("vf-%s-%s-alb-sg", var.account_environment, var.vf_region)
  description = "AWS ALB Security Group"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "vf-alb-sg-ingress" {
  security_group_id        = "${aws_security_group.alb_sg.id}"
  description              = "Allow App access on All ports"
  type                     = "ingress"
  cidr_blocks              = var.vpc_cidr_blocks
  from_port                = "0"
  to_port                  = "65535"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "vf-alb-sg-egress-1" {
  security_group_id = "${aws_security_group.alb_sg.id}"
  description       = "Allow egress to Internet"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  to_port           = "65535"
  protocol          = "-1"
}

