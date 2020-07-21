resource "aws_security_group" "vf-rds-sg" {
  name        = format("vf-%s-%s-rds-sg", var.account_environment, var.vf_region)
  description = "RDS MySQL Security Group"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "vf-rds-sg-ingress1" {
  security_group_id        = "${aws_security_group.vf-rds-sg.id}"
  description              = "Allow App access from VPC to 3306 Port"
  type                     = "ingress"
  cidr_blocks              = var.vpc_cidr_blocks
  from_port                = "3306"
  to_port                  = "3306"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "vf-rds-sg-ingress2" {
  security_group_id        = "${aws_security_group.vf-rds-sg.id}"
  description              = "Allow App access from VPC to 3306 Port"
  type                     = "ingress"
  cidr_blocks              = ["10.11.0.0/16"]
  from_port                = "3306"
  to_port                  = "3306"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "vf-rds-sg-egress" {
  security_group_id = "${aws_security_group.vf-rds-sg.id}"
  description       = "Allow egress to Internet"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  to_port           = "65535"
  protocol          = "-1"
}
