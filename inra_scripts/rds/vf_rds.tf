data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_db_subnet_group" "default" {
  name       = format("vf-%s-%s-rds-subnet-group", var.account_environment, var.vf_region)
  subnet_ids = var.subnet_ids
}

#resource "aws_secretsmanager_secret" "db" {
#  name = format("vf-%s-%s-db", var.account_environment, var.vf_region)
#}

#resource "aws_secretsmanager_secret_version" "db" {
#  secret_id     = "${aws_secretsmanager_secret.db.id}"
#  secret_string = "masterpassword"
#}

resource "aws_db_instance" "main" {
  identifier             = format("vf-%s-%s-rds-instance", var.account_environment, var.vf_region)
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7.16"
  instance_class         = "db.t2.micro"
  username               = "root"
  password               = "masterpassword"
  parameter_group_name   = "default.mysql5.7"
  max_allocated_storage  = 100
  availability_zone      = data.aws_availability_zones.available.names[0]
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.vf-rds-sg.id]
  publicly_accessible    = false
}

#output "rds_db_pwd" {
#  value = "${aws_secretsmanager_secret_version.db.arn}"
#}

